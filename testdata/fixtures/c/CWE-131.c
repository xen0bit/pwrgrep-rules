/* CWE-131: Incorrect Calculation of Buffer Size.
 *
 * strlen counts the characters and not the NUL that ends them, so a buffer
 * sized by strlen alone is exactly one byte too small for the string it was
 * sized for. The copy that follows writes that byte past the end.
 */
#include <alloca.h>
#include <stdlib.h>
#include <string.h>

char *join(const char *a, const char *b)
{
    /* ruleid: c-buffer-size-off-by-one */
    char *one = malloc(strlen(a));
    strcpy(one, a);

    /* ruleid: c-buffer-size-off-by-one */
    char *both = malloc(strlen(a) + strlen(b));
    strcpy(both, a);
    strcat(both, b);

    /* ruleid: c-buffer-size-off-by-one */
    char *stacked = alloca(strlen(a));
    /* ruleid: c-buffer-size-off-by-one */
    char *grown = realloc(one, strlen(b));
    /* ruleid: c-buffer-size-off-by-one */
    char *wide = calloc(wcslen(a), sizeof(wchar_t));

    /* ok: c-buffer-size-off-by-one */
    char *right = malloc(strlen(a) + 1);
    /* ok: c-buffer-size-off-by-one */
    char *right_both = malloc(strlen(a) + strlen(b) + 1);
    /* ok: c-buffer-size-off-by-one */
    char *counted = malloc(strlen(a) + 16);
    /* ok: c-buffer-size-off-by-one */
    char *sized = malloc(1024);

    (void)stacked; (void)grown; (void)wide; (void)right;
    (void)right_both; (void)counted; (void)sized;
    return both;
}
