/* CWE-367: Time-of-check Time-of-use Race Condition.
 *
 * access() and stat() answer a question about a name, and open() asks a
 * question about a name. Between the two answers the name can be made to
 * refer to something else - a symlink swapped in by anyone who can write the
 * directory - so the program checks one file and opens another. Where the
 * program is setuid, the file it checked was the attacker's and the file it
 * opened is /etc/shadow.
 */
#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>

void write_if_allowed(const char *path, const char *text)
{
    struct stat st;

    /* ruleid: c-toctou-check-then-use */
    if (access(path, W_OK) == 0) {
        FILE *f = fopen(path, "w");
        fputs(text, f);
        fclose(f);
    }

    /* ruleid: c-toctou-check-then-use */
    if (stat(path, &st) == 0 && S_ISREG(st.st_mode)) {
        int fd = open(path, O_WRONLY);
        close(fd);
    }

    /* ruleid: c-toctou-check-then-use */
    if (lstat(path, &st) != 0)
        creat(path, 0600);

    stat(path, &st);
    /* ruleid: c-toctou-check-then-use */
    int fd = open(path, O_RDONLY);
    close(fd);
}

void write_safely(const char *path, const char *text)
{
    struct stat st;

    /* ok: c-toctou-check-then-use */
    int fd = open(path, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW, 0600);
    if (fd < 0)
        return;
    /* ok: c-toctou-check-then-use */
    if (fstat(fd, &st) == 0 && S_ISREG(st.st_mode)) {
        write(fd, text, strlen(text));
        fchmod(fd, 0600);
    }
    /* ok: c-toctou-check-then-use */
    if (st.st_uid == getuid()) {
        write(fd, text, 1);
    }
    close(fd);
}
