/* CWE-20: Improper Input Validation.
 *
 * sscanf converting a number has no way to report that the number did not
 * fit. On overflow the behaviour is undefined, and in practice the variable
 * gets a value the input did not contain. strtol reports both.
 */
#include <stdio.h>
#include <stdlib.h>

void parse(const char *text)
{
    int n;
    long l;
    double d;
    char word[32];

    /* ruleid: incorrect-use-sscanf-fn */
    sscanf(text, "%d", &n);
    /* ruleid: incorrect-use-sscanf-fn */
    sscanf(text, "%ld", &l);
    /* ruleid: incorrect-use-sscanf-fn */
    sscanf(text, "%lf", &d);

    /* ok: incorrect-use-sscanf-fn */
    sscanf(text, "%31s", word);
    /* ok: incorrect-use-sscanf-fn */
    l = strtol(text, NULL, 10);
}
