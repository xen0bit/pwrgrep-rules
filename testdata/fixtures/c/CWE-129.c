/* CWE-129: Improper Validation of Array Index.
 *
 * An index that arrived from outside indexes wherever it was told to. A
 * negative one reads behind the array and a large one reads past it, and
 * neither the subscript nor the compiler will say so - C does not check.
 */
#include <stdlib.h>
#include <string.h>

static int table[64];

int lookup(int argc, char **argv, const char *name)
{
    int i = atoi(argv[1]);
    /* ruleid: c-unvalidated-array-index */
    table[i] = 1;

    long n = strtol(getenv("SLOT"), NULL, 10);
    char scratch[16];
    /* ruleid: c-unvalidated-array-index */
    scratch[n] = 'x';

    int copy = i;
    /* ruleid: c-unvalidated-array-index */
    table[copy] += 1;

    int j = atoi(argv[2]);
    /* ok: c-unvalidated-array-index */
    if (j >= 0 && j < 64)
        table[j] = 3;

    int k = atoi(argv[3]) % 64;
    /* ok: c-unvalidated-array-index */
    table[k] = 4;

    /* ok: c-unvalidated-array-index */
    table[7] = 5;

    /* ok: c-unvalidated-array-index */
    return table[strlen(name) & 63];
}
