/* CWE-134: Use of Externally-Controlled Format String.
 *
 * The format argument of a printf-family call decides how many further
 * arguments are read off the stack and, with %n, what is written back. A
 * format that is not a literal is a format an attacker may have written.
 */
#include <stdarg.h>
#include <stdio.h>
#include <syslog.h>
#include <unistd.h>

void report(const char *user, char *out, size_t n, va_list ap)
{
    /* ruleid: c-uncontrolled-format-string */
    printf(user);
    /* ruleid: c-uncontrolled-format-string */
    printf(user, 1);
    /* ruleid: c-uncontrolled-format-string */
    fprintf(stderr, user);
    /* ruleid: c-uncontrolled-format-string */
    dprintf(STDERR_FILENO, user);
    /* ruleid: c-uncontrolled-format-string */
    sprintf(out, user);
    /* ruleid: c-uncontrolled-format-string */
    snprintf(out, n, user);
    /* ruleid: c-uncontrolled-format-string */
    asprintf(&out, user);
    /* ruleid: c-uncontrolled-format-string */
    syslog(LOG_ERR, user);
    /* ruleid: c-uncontrolled-format-string */
    vprintf(user, ap);
    /* ruleid: c-uncontrolled-format-string */
    vfprintf(stderr, user, ap);
    /* ruleid: c-uncontrolled-format-string */
    vsnprintf(out, n, user, ap);
    /* ruleid: c-uncontrolled-format-string */
    err(1, user);
    /* ruleid: c-uncontrolled-format-string */
    warnx(user);

    /* ok: c-uncontrolled-format-string */
    printf("%s", user);
    /* ok: c-uncontrolled-format-string */
    fprintf(stderr, "%s\n", user);
    /* ok: c-uncontrolled-format-string */
    snprintf(out, n, "%s", user);
    /* ok: c-uncontrolled-format-string */
    syslog(LOG_ERR, "%s", user);
    /* ok: c-uncontrolled-format-string */
    printf(_("welcome, %s\n"), user);
    /* ok: c-uncontrolled-format-string */
    printf(L"a wide literal is still a literal\n");
    /* ok: c-uncontrolled-format-string */
    vsnprintf(out, n, "%s", ap);
}
