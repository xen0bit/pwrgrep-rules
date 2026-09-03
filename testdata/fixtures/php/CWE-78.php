<?php
/* CWE-78: Improper Neutralization of Special Elements used in an OS Command.
 *
 * Every one of these hands a string to /bin/sh. A shell reading a string a
 * program assembled is a shell reading whatever ended up in it, and `;`,
 * `$( )` and `|` are ordinary characters until then. escapeshellarg is the
 * function that makes one argument safe; there is nothing that makes a whole
 * command line safe.
 */

function ping($host, $file)
{
    /* ruleid: exec-use */
    system("ping -c1 " . $host);
    /* ruleid: exec-use */
    exec("ls " . $file, $out);
    /* ruleid: exec-use */
    shell_exec("cat {$file}");
    /* ruleid: exec-use */
    passthru($_GET['cmd']);
    /* ruleid: exec-use */
    popen("gzip " . $file, "r");
    /* ruleid: exec-use */
    proc_open($_POST['cmd'], [], $pipes);
    /* ruleid: exec-use */
    pcntl_exec($file);

    /* ok: exec-use */
    system("uptime");
    /* ok: exec-use */
    exec('df -h', $out);
    /* ok: exec-use */
    shell_exec("id -u");
    /* ok: exec-use */
    system("ping -c1 " . escapeshellarg($host));
}
