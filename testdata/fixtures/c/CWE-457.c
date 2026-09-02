/* CWE-457: Use of Uninitialized Variable.
 *
 * A local with no initialiser holds whatever the last function to use that
 * part of the frame left there. It is not zero, it is not random, and it is
 * not the same twice - which is why a program built on one reads correctly in
 * testing and wrongly in production. Where the value is a length, a flag or a
 * pointer, what it decides is decided by the previous call.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

int report(const char *path, int flag)
{
    /* ruleid: c-uninitialized-read */
    int count;
    printf("%d\n", count);

    /* ruleid: c-uninitialized-read */
    size_t len;
    memcpy(NULL, path, len);

    /* ruleid: c-uninitialized-read */
    int rc;
    return rc;
}

int report_properly(const char *path, int flag)
{
    /* ok: c-uninitialized-read */
    int count = 0;
    printf("%d\n", count);

    /* ok: c-uninitialized-read */
    size_t len;
    len = strlen(path);
    printf("%zu\n", len);

    /* ok: c-uninitialized-read */
    struct stat st;
    stat(path, &st);
    printf("%ld\n", (long)st.st_size);

    /* ok: c-uninitialized-read */
    int rc;
    if (flag)
        rc = 1;
    else
        rc = 2;
    return rc;
}
