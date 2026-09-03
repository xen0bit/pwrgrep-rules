/* CWE-252: Unchecked Return Value.
 *
 * read() returns how much it read, which is not how much was asked for. A
 * program that ignores it uses a buffer that was filled partly, or not at
 * all, with whatever was in it before - and on a socket "not at all" is the
 * ordinary case rather than the error case.
 */
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

int load(int fd, int sock, FILE *f, char *out, size_t n)
{
    char header[16];
    char line[128];

    /* ruleid: c-unchecked-read */
    read(fd, header, sizeof header);
    /* ruleid: c-unchecked-read */
    recv(sock, out, n, 0);
    /* ruleid: c-unchecked-read */
    fread(out, 1, n, f);
    /* ruleid: c-unchecked-read */
    fgets(line, sizeof line, f);
    /* ruleid: c-unchecked-read */
    (void)pread(fd, out, n, 0);

    /* ok: c-unchecked-read */
    if (read(fd, header, sizeof header) != (ssize_t)sizeof header)
        return -1;
    /* ok: c-unchecked-read */
    ssize_t got = recv(sock, out, n, 0);
    if (got <= 0)
        return -1;
    /* ok: c-unchecked-read */
    while (fread(out, 1, n, f) == n)
        continue;
    /* ok: c-unchecked-read */
    if (fgets(line, sizeof line, f) == NULL)
        return -1;
    /* ok: c-unchecked-read */
    return (int)read(fd, out, n);
}
