/* CWE-120: Buffer Copy without Checking Size of Input.
 *
 * scanf's %s has no length and stops at whitespace, so it writes as much as
 * the input has into a buffer whose size it was never told.
 */
#include <stdio.h>

void read_word(char *out)
{
    char word[16];
    int n;

    /* ruleid: insecure-use-scanf-fn */
    scanf("%s", word);
    /* ruleid: insecure-use-scanf-fn */
    scanf("%d", &n);

    /* ok: insecure-use-scanf-fn */
    fgets(out, 16, stdin);
    /* ok: insecure-use-scanf-fn */
    sscanf(out, "%15s", word);
}
