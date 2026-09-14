/* CWE-226: Sensitive Information in Resource Not Removed Before Reuse.
 *
 * memset is the clear a compiler is allowed to delete, so a buffer that held
 * a key and was wiped with it may not have been wiped at all. A buffer whose
 * name says nothing about what it held (scratch, buf) is not reported: the
 * data shows that is mostly ordinary work, and the rule cannot tell.
 */
#include <string.h>
#include <strings.h>

void reuse(unsigned char *key, size_t n)
{
    unsigned char scratch[32];

    /* ruleid: insecure-use-memset */
    memset(key, 0, n);
    /* The name does not say a secret was here. */
    /* ok: insecure-use-memset */
    memset(scratch, 0, sizeof scratch);

    /* ok: insecure-use-memset */
    explicit_bzero(scratch, sizeof scratch);
    /* ok: insecure-use-memset */
    memset_s(key, n, 0, n);
}
void wipe2(char *buf, size_t len) {
    /* ok: insecure-use-memset */
    memset(buf, 0, len);
    /* ok: insecure-use-memset */
    memset(buf, 0, 32);
}
void safe3(char *buf) {
    /* ok: insecure-use-memset */
    sodium_memzero(buf, 32);
}
