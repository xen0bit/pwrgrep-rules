/* CWE-590: Free of Memory not on the Heap.
 *
 * free() is told an address and takes the allocator bookkeeping that should
 * sit in front of it on trust. Hand it a stack address, or a pointer into the
 * middle of a block, and it reads whatever is there as a chunk header - which
 * is the starting position for a good many heap exploits.
 */
#include <alloca.h>
#include <stdlib.h>
#include <string.h>

void release(size_t n)
{
    char stack[64];
    char rows[4][32];
    int count = 0;
    char *scratch = alloca(n);
    char *heap = malloc(n);

    /* ruleid: c-free-of-non-heap */
    free(stack);
    /* ruleid: c-free-of-non-heap */
    free(rows);
    /* ruleid: c-free-of-non-heap */
    free(&count);
    /* ruleid: c-free-of-non-heap */
    free(scratch);
    /* ruleid: c-free-of-non-heap */
    free(heap + 1);

    /* ok: c-free-of-non-heap */
    free(heap);
    /* ok: c-free-of-non-heap */
    free(NULL);
}
