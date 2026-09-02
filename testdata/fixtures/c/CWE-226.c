/* CWE-226: Sensitive Information in Resource Not Removed Before Reuse.
 *
 * memset is the clear a compiler is allowed to delete, so a buffer that held
 * a key and was wiped with it may not have been wiped at all. Which of these
 * buffers held something worth wiping is not in the call, so this rule points
 * at the call and leaves that to the reader.
 */
#include <string.h>
#include <strings.h>

void reuse(unsigned char *key, size_t n)
{
    unsigned char scratch[32];

    /* ruleid: insecure-use-memset */
    memset(key, 0, n);
    /* ruleid: insecure-use-memset */
    memset(scratch, 0, sizeof scratch);

    /* ok: insecure-use-memset */
    explicit_bzero(scratch, sizeof scratch);
    /* ok: insecure-use-memset */
    memset_s(key, n, 0, n);
}
