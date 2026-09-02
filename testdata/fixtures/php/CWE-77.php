<?php
/* CWE-77: Improper Neutralization of Special Elements used in a Command.
 *
 * Backticks are shell_exec with punctuation instead of a name, and the
 * quietness is the problem: a variable interpolated between them is a
 * variable handed to /bin/sh, and it does not read like a call to anything.
 */

function disk_usage($dir, $user)
{
    /* ruleid: backticks-use */
    $out = `du -sh $dir`;
    /* ruleid: backticks-use */
    $who = `id {$user}`;
    /* ruleid: backticks-use */
    $files = `ls -la "$dir"`;
    /* ruleid: backticks-use */
    $any = `ps aux | grep $user`;

    /* ok: backticks-use */
    $uptime = `uptime`;
    /* ok: backticks-use */
    $free = `df -h /`;
    /* ok: backticks-use */
    $safe = shell_exec('id -u');

    return [$out, $who, $files, $any, $uptime, $free, $safe];
}
