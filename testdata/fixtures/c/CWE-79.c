/* CWE-79: XSS via non-literal output */
#include <stdio.h>
void vuln(const char *user) {
    char buf[256];
    /* ruleid: c-xss */
    printf(user);
    /* ruleid: c-xss */
    puts(user);
    /* ruleid: c-xss */
    sprintf(buf, "<div>%s</div>", user);
    /* ruleid: c-xss */
    fprintf(stdout, user);
    /* ok: c-xss */
    printf("<div>hello</div>");
    /* ok: c-xss */
    puts("safe");
    /* ok: c-xss */
    sprintf(buf, "fixed %s", "safe");
}
