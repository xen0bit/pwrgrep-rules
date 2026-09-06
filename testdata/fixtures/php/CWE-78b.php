<?php
/* CWE-78: OS Command Injection with taint flow.
 *
 * Each sink hands a string to /bin/sh. When the string is built from
 * the request, a `;` or `|` in the value starts a second command.
 */

function handle($file, $host)
{
    $cmd = $_GET['cmd'];
    /* ruleid: php-os-command-injection */
    $out = shell_exec($cmd);
    /* ruleid: php-os-command-injection */
    system($_POST['host'] . " -c 1");
    /* ruleid: php-os-command-injection */
    exec("ls " . $_REQUEST['dir'], $out);
    /* ruleid: php-os-command-injection */
    passthru($_COOKIE['cmd']);
    $a = $_GET['x'];
    /* ruleid: php-os-command-injection */
    $res = popen("cat " . $a, "r");

    /* ok: php-os-command-injection */
    system("uptime");
    /* ok: php-os-command-injection */
    exec("ls -la /tmp", $out);
    /* ok: php-os-command-injection */
    $safe = escapeshellarg($host);
    system("ping -c1 " . $safe);
}
