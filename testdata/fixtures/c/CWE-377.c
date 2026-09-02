/* CWE-377: Insecure Temporary File.
 *
 * The bug is the gap between choosing a name and creating the file. Whoever
 * else can write the directory can put something at that name first - a
 * symlink to /etc/passwd will do - and the program then opens their file
 * believing it made it.
 */
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int scratch(char *tmpl)
{
    char name[L_tmpnam];

    /* ruleid: c-insecure-temporary-file */
    tmpnam(name);
    /* ruleid: c-insecure-temporary-file */
    tmpnam_r(name);
    /* ruleid: c-insecure-temporary-file */
    tempnam("/tmp", "pfx");
    /* ruleid: c-insecure-temporary-file */
    mktemp(tmpl);
    /* ruleid: c-insecure-temporary-file */
    fopen("/tmp/session.lock", "w");
    /* ruleid: c-insecure-temporary-file */
    open("/var/tmp/build.out", O_CREAT | O_WRONLY, 0600);
    /* ruleid: c-insecure-temporary-file */
    creat("/dev/shm/pwrq.sock", 0600);

    /* ok: c-insecure-temporary-file */
    mkstemp(tmpl);
    /* ok: c-insecure-temporary-file */
    mkostemp(tmpl, O_CLOEXEC);
    /* ok: c-insecure-temporary-file */
    mkdtemp(tmpl);
    /* ok: c-insecure-temporary-file */
    tmpfile();
    /* ok: c-insecure-temporary-file */
    open(tmpl, O_CREAT | O_EXCL | O_WRONLY, 0600);
    return 0;
}
