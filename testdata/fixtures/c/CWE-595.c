/* CWE-595: Comparison of Object References Instead of Object Contents.
 *
 * == on two char pointers asks whether they are the same address. It is a
 * well-formed comparison and it compiles without a word, and it answers a
 * question about identity where the program meant to ask one about text - so
 * it is true for two names for one buffer and false for two buffers holding
 * the same string.
 */
#include <string.h>

int same(const char *a, const char *b, char *left, char *right)
{
    /* ruleid: c-string-equality */
    if ((char *)left == (char *)right)
        return 1;
    /* ruleid: c-string-equality */
    if ((const char *)a != (const char *)b)
        return 0;
    /* ruleid: c-string-equality */
    if (a == "admin")
        return 1;
    /* ruleid: c-string-equality */
    if ("root" == b)
        return 1;

    /* ok: c-string-equality */
    if (strcmp(a, b) == 0)
        return 1;
    /* ok: c-string-equality */
    if (left == NULL)
        return 0;
    /* ok: c-string-equality */
    if (a[0] == 'x')
        return 1;
    return 0;
}
