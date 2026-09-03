/* CWE-663: Use of a Non-reentrant Function in a Concurrent Context.
 *
 * strtok keeps the rest of the string in a static, so two callers tokenising
 * two strings destroy each other's position - and the first caller is often a
 * library the second one does not know it is inside of.
 */
#include <string.h>

void split(char *line, char *other)
{
    /* ruleid: insecure-use-strtok-fn */
    char *field = strtok(line, ",");
    while (field != NULL) {
        /* ruleid: insecure-use-strtok-fn */
        field = strtok(NULL, ",");
    }

    char *save = NULL;
    /* ok: insecure-use-strtok-fn */
    char *piece = strtok_r(other, ",", &save);
    (void)piece;
}
