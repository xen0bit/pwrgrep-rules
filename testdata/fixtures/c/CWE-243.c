/* CWE-243: Creation of chroot Jail Without Changing Working Directory.
 *
 * chroot moves the root of the filesystem and leaves the working directory
 * where it was. If that directory is outside the new root, the process still
 * holds a handle to it, and "../../.." from there walks straight back out -
 * the jail is built and the door is left open behind it.
 */
#include <unistd.h>

void jail_and_run(const char *dir, const char *cmd)
{
    /* ruleid: c-chroot-without-chdir */
    chroot(dir);
    execl("/bin/sh", "sh", "-c", cmd, (char *)NULL);
}

void jail_checked(const char *dir, const char *cmd)
{
    if (chroot(dir) != 0)
        return;
    /* ok: c-chroot-without-chdir */
    if (chdir("/") != 0)
        return;
    execl("/bin/sh", "sh", "-c", cmd, (char *)NULL);
}

void jail_plain(const char *dir, const char *cmd)
{
    /* ok: c-chroot-without-chdir */
    chroot(dir);
    chdir("/");
    execl("/bin/sh", "sh", "-c", cmd, (char *)NULL);
}
