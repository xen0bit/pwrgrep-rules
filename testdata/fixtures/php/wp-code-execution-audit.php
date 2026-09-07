<?php
// Audit: these built-ins compile or run their arguments. Flag every use;
// review each for user-controlled input.

function handle_code($input, $fn, $a, $b)
{
    // ruleid: wp-code-execution-audit
    eval($input);
    // ruleid: wp-code-execution-audit
    assert($input);
    // ruleid: wp-code-execution-audit
    call_user_func($fn, $a, $b);

    // ok: wp-code-execution-audit
    strlen($input);
    // ok: wp-code-execution-audit
    htmlspecialchars($input);
    // ok: wp-code-execution-audit
    sprintf('%s', $input);
}
