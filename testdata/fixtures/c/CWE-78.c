/* CWE-78: Improper Neutralization of Special Elements used in an OS Command.
 *
 * Two ways the same mistake is written: handing a shell a command line that
 * is not a literal, and handing exec a program name that is not a literal.
 * In the first the attacker gets metacharacters, in the second the attacker
 * gets to choose the binary.
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <wordexp.h>

void run(const char *user, char **argv, wordexp_t *w)
{
    char cmd[256];
    snprintf(cmd, sizeof cmd, "ping -c1 %s", user);

    /* ruleid: c-os-command-injection */
    system(cmd);
    /* ruleid: c-os-command-injection */
    system(user);
    /* ruleid: c-os-command-injection */
    popen(cmd, "r");
    /* ruleid: c-os-command-injection */
    wordexp(user, w, 0);
    /* ruleid: c-os-command-injection */
    execl("/bin/sh", "sh", "-c", cmd, (char *)NULL);
    /* ruleid: c-os-command-injection */
    execlp("bash", "bash", "-c", user, (char *)NULL);
    /* ruleid: c-os-command-injection */
    execvp(user, argv);
    /* ruleid: c-os-command-injection */
    execv(user, argv);

    /* ok: c-os-command-injection */
    system("/usr/bin/uptime");
    /* ok: c-os-command-injection */
    popen("/bin/df -h", "r");
    /* ok: c-os-command-injection */
    execl("/bin/sh", "sh", "-c", "id -u", (char *)NULL);
    /* ok: c-os-command-injection */
    execv("/bin/ls", argv);
    /* ok: c-os-command-injection */
    execve("/usr/bin/ping", argv, NULL);
}
