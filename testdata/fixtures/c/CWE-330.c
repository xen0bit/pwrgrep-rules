/* CWE-330: Use of Insufficiently Random Values.
 *
 * rand() is a linear congruential generator with a published recurrence: a
 * few outputs give away the state, and the state gives away every output
 * after it. Seeding it from the clock makes the first output guessable too,
 * because the clock is a value an attacker also has.
 */
#include <stdlib.h>
#include <time.h>
#include <sys/random.h>
#include <openssl/rand.h>

void issue_token(unsigned char *out, size_t n, unsigned int *state)
{
    /* ruleid: c-insecure-randomness */
    srand(time(NULL));
    /* ruleid: c-insecure-randomness */
    srand(getpid());
    /* ruleid: c-insecure-randomness */
    out[0] = rand() & 0xff;
    /* ruleid: c-insecure-randomness */
    out[1] = rand_r(state) & 0xff;
    /* ruleid: c-insecure-randomness */
    out[2] = random() & 0xff;
    /* ruleid: c-insecure-randomness */
    srandom(time(NULL));
    /* ruleid: c-insecure-randomness */
    out[3] = (unsigned char)(drand48() * 256);
    /* ruleid: c-insecure-randomness */
    out[4] = lrand48() & 0xff;
    /* ruleid: c-insecure-randomness */
    srand48(time(NULL));
    /* ruleid: c-insecure-randomness */
    RAND_pseudo_bytes(out, n);

    /* ok: c-insecure-randomness */
    getrandom(out, n, 0);
    /* ok: c-insecure-randomness */
    arc4random_buf(out, n);
    /* ok: c-insecure-randomness */
    out[5] = arc4random() & 0xff;
    /* ok: c-insecure-randomness */
    RAND_bytes(out, n);
}
