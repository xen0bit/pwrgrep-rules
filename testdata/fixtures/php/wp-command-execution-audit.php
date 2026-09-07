<?php
// Audit: these built-ins hand their arguments to a shell. Flag every use;
// review each for user-controlled input.

function handle_command($input, $args)
{
    // ruleid: wp-command-execution-audit
    system($input);
    // ruleid: wp-command-execution-audit
    exec($input, $args);
    // ruleid: wp-command-execution-audit
    passthru($input);
    // ruleid: wp-command-execution-audit
    shell_exec($input);

    // ok: wp-command-execution-audit
    escapeshellarg($input);
    // ok: wp-command-execution-audit
    strlen($input);
}
