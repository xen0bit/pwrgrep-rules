/* CWE-676: Use of Potentially Dangerous Function.
 *
 * The ato* family cannot report failure. atoi("abc") is 0 and so is atoi("0"),
 * and atoi of something larger than INT_MAX is undefined - so every value the
 * caller might want to reject arrives looking exactly like a valid zero.
 */
#include <stdlib.h>

long read_numbers(const char *text)
{
    /* ruleid: incorrect-use-ato-fn */
    int a = atoi(text);
    /* ruleid: incorrect-use-ato-fn */
    long b = atol(text);
    /* ruleid: incorrect-use-ato-fn */
    long long c = atoll(text);

    char *end = NULL;
    /* ok: incorrect-use-ato-fn */
    long d = strtol(text, &end, 10);
    /* ok: incorrect-use-ato-fn */
    if (end == text)
        return -1;

    return a + b + c + d;
}
