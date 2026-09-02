/* CWE-732: Incorrect Permission Assignment for Critical Resource.
 *
 * A mode whose low octal digit carries the write bit is a file every other
 * account on the machine may rewrite. The umask calls are the same decision
 * made in advance: a mask with no write bit in it removes nothing, so every
 * file the process creates afterwards keeps whatever the creating call asked
 * for.
 */
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

void install(const char *path, int fd)
{
    /* ruleid: c-world-writable-permissions */
    chmod(path, 0777);
    /* ruleid: c-world-writable-permissions */
    chmod(path, 0666);
    /* ruleid: c-world-writable-permissions */
    fchmod(fd, 0662);
    /* ruleid: c-world-writable-permissions */
    fchmodat(AT_FDCWD, path, 0757, 0);
    /* ruleid: c-world-writable-permissions */
    mkdir("/var/lib/app", 0777);
    /* ruleid: c-world-writable-permissions */
    mkfifo("/var/run/app.fifo", 0666);
    /* ruleid: c-world-writable-permissions */
    creat(path, 0666);
    /* ruleid: c-world-writable-permissions */
    open(path, O_CREAT | O_WRONLY, 0666);
    /* ruleid: c-world-writable-permissions */
    chmod(path, S_IRWXU | S_IRWXG | S_IRWXO);
    /* ruleid: c-world-writable-permissions */
    umask(0);
    /* ruleid: c-world-writable-permissions */
    umask(0011);

    /* ok: c-world-writable-permissions */
    chmod(path, 0600);
    /* ok: c-world-writable-permissions */
    fchmod(fd, 0640);
    /* ok: c-world-writable-permissions */
    mkdir("/var/lib/app", 0755);
    /* ok: c-world-writable-permissions */
    open(path, O_CREAT | O_EXCL | O_WRONLY, 0600);
    /* ok: c-world-writable-permissions */
    umask(077);
    /* ok: c-world-writable-permissions */
    umask(022);
}
