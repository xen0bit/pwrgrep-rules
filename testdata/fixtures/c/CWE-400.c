/* CWE-400: Uncontrolled Resource Consumption.
 *
 * read() on /dev/random blocks when the pool is short of entropy and returns
 * -1 with EAGAIN when the descriptor is non-blocking. A caller that ignores
 * the count treats the buffer as filled and opens the next descriptor, and a
 * loop doing that runs the process out of file descriptors while the bytes it
 * is "generating" stay whatever the buffer held.
 */
#include <fcntl.h>
#include <unistd.h>

void seed(unsigned char *out, size_t n)
{
    int fd;

    fd = open("/dev/random", O_RDONLY);
    /* ruleid: random-fd-exhaustion */
    read(fd, out, n);
    close(fd);

    int fd2 = open("/dev/urandom", O_RDONLY);
    /* ruleid: random-fd-exhaustion */
    read(fd2, out, n);
    close(fd2);

    int fd3 = open("/dev/urandom", O_RDONLY);
    /* ok: random-fd-exhaustion */
    ssize_t got = read(fd3, out, n);
    if (got != (ssize_t)n)
        return;
    close(fd3);

    fd = open("/dev/random", O_RDONLY);
    /* ok: random-fd-exhaustion */
    got = read(fd, out, n);
    close(fd);
}
