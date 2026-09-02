/* CWE-273: Improper Check for Dropped Privileges.
 *
 * setuid can fail. It fails when RLIMIT_NPROC is already at its limit for the
 * target user, which an attacker can arrange by filling the process table -
 * and a program that does not look at the return value carries on with the
 * privileges it believed it had given up. Everything after that line runs as
 * root, including the part that was written on the assumption that it does
 * not.
 */
#include <grp.h>
#include <unistd.h>

int drop(uid_t uid, gid_t gid)
{
    /* ruleid: c-unchecked-privilege-drop */
    setgroups(0, NULL);
    /* ruleid: c-unchecked-privilege-drop */
    setgid(gid);
    /* ruleid: c-unchecked-privilege-drop */
    setuid(uid);
    /* ruleid: c-unchecked-privilege-drop */
    seteuid(uid);
    /* ruleid: c-unchecked-privilege-drop */
    setresuid(uid, uid, uid);
    /* ruleid: c-unchecked-privilege-drop */
    (void)setreuid(uid, uid);
    if (uid > 0) {
        /* ruleid: c-unchecked-privilege-drop */
        setegid(gid);
    }

    /* ok: c-unchecked-privilege-drop */
    if (setgroups(0, NULL) != 0)
        return -1;
    /* ok: c-unchecked-privilege-drop */
    if (setgid(gid) == -1)
        return -1;
    /* ok: c-unchecked-privilege-drop */
    int rc = setuid(uid);
    if (rc != 0)
        return -1;
    /* ok: c-unchecked-privilege-drop */
    while (setresgid(gid, gid, gid) < 0)
        return -1;
    /* ok: c-unchecked-privilege-drop */
    return setegid(gid);
}
