/* CWE-401: Missing Release of Memory after Effective Lifetime.
 *
 * realloc returns NULL when it cannot grow the block, and it leaves the old
 * block exactly where it was. Assigning the result over the only pointer to
 * that block therefore loses it: the memory is still allocated and nothing
 * refers to it any more. Under memory pressure - which is when an attacker
 * puts the program - this leaks on every attempt.
 */
#include <stdlib.h>
#include <string.h>

struct buffer {
    char *data;
    size_t len;
};

int grow(struct buffer *b, char **rows, size_t n)
{
    char *text = malloc(16);

    /* ruleid: c-realloc-loses-the-block */
    text = realloc(text, n);
    /* ruleid: c-realloc-loses-the-block */
    b->data = realloc(b->data, n);
    /* ruleid: c-realloc-loses-the-block */
    rows[0] = realloc(rows[0], n);
    /* ruleid: c-realloc-loses-the-block */
    if ((text = realloc(text, n * 2)) == NULL)
        return -1;

    /* ok: c-realloc-loses-the-block */
    char *grown = realloc(text, n);
    if (grown == NULL) {
        free(text);
        return -1;
    }
    /* ok: c-realloc-loses-the-block */
    text = grown;
    /* ok: c-realloc-loses-the-block */
    b->len = n;
    return 0;
}
