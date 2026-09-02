/* CWE-415: Double Free.
 *
 * The second free is handed an address the allocator has already taken back,
 * so it operates on the free list rather than on a block: the chunk header it
 * reads is whatever is there now. That is enough to corrupt the allocator's
 * bookkeeping and, from there, to make a later malloc return a pointer into
 * memory that is already in use.
 */
#include <stdlib.h>
#include <string.h>

void twice(const char *text, int flag)
{
    char *buf = malloc(64);
    strcpy(buf, text);
    free(buf);
    /* ruleid: double-free */
    free(buf);

    char *note = malloc(64);
    free(note);
    if (flag)
        strcpy(note, text);
    /* ruleid: double-free */
    free(note);
}

void once(const char *text, int flag)
{
    char *buf = malloc(64);
    free(buf);
    buf = NULL;
    /* ok: double-free */
    free(buf);

    char *note = malloc(64);
    free(note);
    note = malloc(128);
    strcpy(note, text);
    /* ok: double-free */
    free(note);

    char *keep = malloc(64);
    strcpy(keep, text);
    /* ok: double-free */
    free(keep);
}
