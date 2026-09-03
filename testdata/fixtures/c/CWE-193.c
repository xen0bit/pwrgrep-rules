/* CWE-193: Off-by-one Error.
 *
 * A count is not an index. `i <= n` runs the body n+1 times, so a loop
 * bounded by the number of elements touches one element past the last, and a
 * loop bounded by strlen touches the NUL and then one past it.
 *
 * `i <= last` is correct and reads almost the same, which is why this is
 * decided on what the bound is called rather than on the operator alone.
 */
#include <string.h>

void copy_all(char *dst, const char *src, size_t count, size_t buflen)
{
    char window[16];
    size_t last = count - 1;

    /* ruleid: c-loop-runs-one-past-the-end */
    for (size_t i = 0; i <= count; i++)
        dst[i] = src[i];

    /* ruleid: c-loop-runs-one-past-the-end */
    for (size_t i = 0; i <= strlen(src); i++)
        dst[i] = src[i];

    /* ruleid: c-loop-runs-one-past-the-end */
    for (size_t i = 0; i <= sizeof(window); i++)
        window[i] = 0;

    /* ruleid: c-loop-runs-one-past-the-end */
    for (size_t i = 0; i <= buflen; i++)
        dst[i] = 'x';

    size_t i = 0;
    /* ruleid: c-loop-runs-one-past-the-end */
    while (i <= count) {
        dst[i] = src[i];
        i++;
    }

    /* ok: c-loop-runs-one-past-the-end */
    for (size_t j = 0; j < count; j++)
        dst[j] = src[j];

    /* ok: c-loop-runs-one-past-the-end */
    for (size_t j = 0; j <= last; j++)
        dst[j] = src[j];

    /* ok: c-loop-runs-one-past-the-end */
    for (size_t j = 0; j <= count; j++)
        total += j;

    /* ok: c-loop-runs-one-past-the-end */
    while (i < buflen)
        i++;
}
