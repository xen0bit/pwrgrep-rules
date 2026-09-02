/* CWE-22: Improper Limitation of a Pathname to a Restricted Directory.
 *
 * A path that arrived from outside is a path that may contain "..", and every
 * ".." is one directory further out of wherever the program meant to stay.
 * Prefixing a base directory does not help: "/var/data/" + "../../etc/shadow"
 * is /etc/shadow.
 */
#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void serve(int argc, char **argv)
{
    char *requested = argv[1];
    /* ruleid: c-path-from-untrusted-input */
    FILE *f = fopen(requested, "r");

    char *configured = getenv("APP_CONFIG");
    /* ruleid: c-path-from-untrusted-input */
    int fd = open(configured, O_RDONLY);

    /* ruleid: c-path-from-untrusted-input */
    unlink(argv[2]);

    char *also = requested;
    /* ruleid: c-path-from-untrusted-input */
    FILE *g = fopen(also, "r");

    /* ok: c-path-from-untrusted-input */
    FILE *fixed = fopen("/etc/app.conf", "r");

    char *resolved = realpath(argv[1], NULL);
    /* ok: c-path-from-untrusted-input */
    FILE *h = fopen(resolved, "r");

    char *leaf = basename(requested);
    /* ok: c-path-from-untrusted-input */
    FILE *i = fopen(leaf, "r");

    (void)f; (void)fd; (void)g; (void)fixed; (void)h; (void)i;
}
