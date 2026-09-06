/* CWE-22: Path Traversal via non-literal */
#include <stdio.h>
#include <unistd.h>
void vuln(const char *user) {
    /* ruleid: c-path-traversal */
    fopen(user, "r");
    /* ruleid: c-path-traversal */
    open(user, 0);
    /* ruleid: c-path-traversal */
    unlink(user);
    /* ok: c-path-traversal */
    fopen("/tmp/fixed.txt", "r");
    /* ok: c-path-traversal */
    open("/etc/hosts", 0);
}
