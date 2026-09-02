/* CWE-806: Buffer Access Using Size of Source Buffer.
 *
 * The length argument of a copy is there to describe the destination. Sized
 * from the source instead, it says how much there is to copy rather than how
 * much there is room for, and the check has been written the wrong way round:
 * it passes exactly when the copy does not fit.
 */
#include <string.h>
#include <stdio.h>

void store(const char *src, size_t srclen)
{
    char small[16];
    char large[256];

    /* ruleid: c-copy-sized-by-source */
    memcpy(small, large, sizeof(large));
    /* ruleid: c-copy-sized-by-source */
    memmove(small, large, sizeof large);
    /* ruleid: c-copy-sized-by-source */
    strncpy(small, src, strlen(src));
    /* ruleid: c-copy-sized-by-source */
    strncat(small, src, strlen(src));
    /* ruleid: c-copy-sized-by-source */
    memcpy(small, src, strlen(src));
    /* ruleid: c-copy-sized-by-source */
    snprintf(small, sizeof(large), "%s", src);

    /* ok: c-copy-sized-by-source */
    memcpy(small, large, sizeof(small));
    /* ok: c-copy-sized-by-source */
    memmove(small, large, sizeof small);
    /* ok: c-copy-sized-by-source */
    strncpy(small, src, sizeof(small) - 1);
    /* ok: c-copy-sized-by-source */
    snprintf(small, sizeof(small), "%s", src);
    /* ok: c-copy-sized-by-source */
    memcpy(large, src, srclen);
}
