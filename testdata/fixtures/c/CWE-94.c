/* CWE-94: Code Injection */
#include <stdlib.h>
#include <stdio.h>
void vuln(const char *user) {
    /* ruleid: c-code-injection */
    system(user);
    /* ruleid: c-code-injection */
    popen(user, "r");
    /* ruleid: c-code-injection */
    system(user);
    /* ok: c-code-injection */
    system("ls -l");
    /* ok: c-code-injection */
    popen("id", "r");
}
