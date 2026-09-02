/* CWE-14: Compiler Removal of Code to Clear Buffers.
 *
 * A memset over a buffer that is never read again is a dead store, and a
 * compiler is entitled to delete it. That is fine for a scratch buffer and
 * not fine for a key: the clearing is deleted, the bytes stay in the freed
 * block or in the frame, and the source still reads as though they were
 * wiped.
 */
#include <stdlib.h>
#include <string.h>

void handle_key(size_t n)
{
    unsigned char *key = malloc(n);
    unsigned char *iv = malloc(16);
    unsigned char *tag = malloc(16);
    unsigned char *nonce = malloc(12);

    /* ruleid: c-cleared-buffer-is-a-dead-store */
    memset(key, 0, n);
    free(key);

    /* ruleid: c-cleared-buffer-is-a-dead-store */
    bzero(iv, 16);
    free(iv);

    /* ok: c-cleared-buffer-is-a-dead-store */
    explicit_bzero(tag, 16);
    free(tag);

    /* ok: c-cleared-buffer-is-a-dead-store */
    memset_s(nonce, 12, 0, 12);
    free(nonce);

    unsigned char *scratch = malloc(n);
    /* ok: c-cleared-buffer-is-a-dead-store */
    memset(scratch, 0, n);
    scratch[0] = 1;
    free(scratch);
}

void sign(const unsigned char *msg, size_t n)
{
    unsigned char secret[32];
    derive(secret, msg, n);
    /* ruleid: c-cleared-buffer-is-a-dead-store */
    memset(secret, 0, sizeof secret);
    return;
}

void sign_properly(const unsigned char *msg, size_t n)
{
    unsigned char secret[32];
    derive(secret, msg, n);
    /* ok: c-cleared-buffer-is-a-dead-store */
    explicit_bzero(secret, sizeof secret);
    return;
}
