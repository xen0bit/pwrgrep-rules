/* CWE-696: Incorrect Behavior Order.
 *
 * Dropping the user id is the step that takes away the ability to drop
 * anything else. Once setuid has succeeded the process is no longer root, so
 * the setgid after it fails - and a program that does not check both is left
 * running as an unprivileged user still in the root group, or still in every
 * supplementary group it started with.
 *
 * The order is setgroups, then setgid, then setuid, and setuid goes last
 * because it is the one that cannot be undone.
 */
#include <grp.h>
#include <unistd.h>

int drop_wrong(uid_t uid, gid_t gid)
{
    /* ruleid: c-privilege-drop-out-of-order */
    setuid(uid);
    setgid(gid);

    /* ruleid: c-privilege-drop-out-of-order */
    if (setuid(uid) != 0)
        return -1;
    if (setgid(gid) != 0)
        return -1;

    /* ruleid: c-privilege-drop-out-of-order */
    if (seteuid(uid) != 0)
        return -1;
    if (setgroups(0, NULL) != 0)
        return -1;

    return 0;
}

int drop_right(uid_t uid, gid_t gid)
{
    /* ok: c-privilege-drop-out-of-order */
    setgroups(0, NULL);
    setgid(gid);
    setuid(uid);

    /* ok: c-privilege-drop-out-of-order */
    if (setgid(gid) != 0)
        return -1;
    if (setuid(uid) != 0)
        return -1;

    return 0;
}
