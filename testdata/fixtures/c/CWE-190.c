/* CWE-190: Integer Overflow or Wraparound.
 *
 * The size argument of an allocator is a size_t, and arithmetic on a size_t
 * wraps silently. A product that wraps asks for a small buffer, the
 * allocation succeeds, and the loop that fills it writes the size it meant to
 * ask for.
 */
#include <alloca.h>
#include <stdlib.h>
#include <string.h>

void *grow(void *old, unsigned count, unsigned extra, size_t itemlen)
{
    /* ruleid: c-allocation-size-overflow */
    int *table = malloc(count * sizeof(int));
    /* ruleid: c-allocation-size-overflow */
    char *rows = malloc(count * itemlen);
    /* ruleid: c-allocation-size-overflow */
    void *bigger = realloc(old, count * sizeof(void *));
    /* ruleid: c-allocation-size-overflow */
    char *scratch = alloca(count * 4);
    /* ruleid: c-allocation-size-overflow */
    char *joined = malloc(count + extra);
    /* ruleid: c-allocation-size-overflow */
    char *mapped = mmap(NULL, count * itemlen, PROT_READ, MAP_PRIVATE, -1, 0);

    /* ok: c-allocation-size-overflow */
    int *safe_table = calloc(count, sizeof(int));
    /* ok: c-allocation-size-overflow */
    void *safe_bigger = reallocarray(old, count, sizeof(void *));
    /* ok: c-allocation-size-overflow */
    char *fixed = malloc(4 * 1024);
    /* ok: c-allocation-size-overflow */
    char *one = malloc(count + 1);
    /* ok: c-allocation-size-overflow */
    char *header = malloc(sizeof(struct stat));

    (void)table; (void)rows; (void)bigger; (void)scratch; (void)joined;
    (void)mapped; (void)safe_table; (void)safe_bigger; (void)fixed;
    (void)one; (void)header;
    return NULL;
}
