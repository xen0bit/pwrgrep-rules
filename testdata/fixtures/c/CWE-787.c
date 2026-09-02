/* CWE-787: Out-of-bounds Write.
 *
 * The oldest bug in C, and the shape it takes is always the same: a function
 * that writes into a destination and was never told how big the destination
 * is. It writes as much as the source has. Every one of these has a
 * counterpart that takes a size, and the counterpart is on the right of each
 * pair below.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <wchar.h>

void read_name(char *dst, const char *src, wchar_t *wdst, const wchar_t *wsrc,
               size_t n, va_list ap)
{
    char buf[64];

    /* ruleid: c-unbounded-string-fn */
    gets(buf);
    /* ruleid: c-unbounded-string-fn */
    strcpy(dst, src);
    /* ruleid: c-unbounded-string-fn */
    strcat(dst, src);
    /* ruleid: c-unbounded-string-fn */
    sprintf(dst, "%s", src);
    /* ruleid: c-unbounded-string-fn */
    vsprintf(dst, "%s", ap);
    /* ruleid: c-unbounded-string-fn */
    stpcpy(dst, src);
    /* ruleid: c-unbounded-string-fn */
    wcscpy(wdst, wsrc);
    /* ruleid: c-unbounded-string-fn */
    wcscat(wdst, wsrc);
    /* ruleid: c-unbounded-string-fn */
    getwd(dst);
    /* ruleid: c-unbounded-string-fn */
    realpath(src, dst);

    /* ok: c-unbounded-string-fn */
    fgets(dst, n, stdin);
    /* ok: c-unbounded-string-fn */
    strlcpy(dst, src, n);
    /* ok: c-unbounded-string-fn */
    strlcat(dst, src, n);
    /* ok: c-unbounded-string-fn */
    snprintf(dst, n, "%s", src);
    /* ok: c-unbounded-string-fn */
    vsnprintf(dst, n, "%s", ap);
    /* ok: c-unbounded-string-fn */
    wcslcpy(wdst, wsrc, n);
    /* ok: c-unbounded-string-fn */
    getcwd(dst, n);
    /* ok: c-unbounded-string-fn */
    realpath(src, NULL);
}
