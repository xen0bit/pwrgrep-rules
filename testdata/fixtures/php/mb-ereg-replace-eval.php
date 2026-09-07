<?php
// The 4th argument to mb_ereg_replace selects evaluation: a variable there
// can turn the replacement into code. Literal option strings stay quiet.

function handle_replace($pattern, $repl, $str, $options)
{
    // ruleid: mb-ereg-replace-eval
    mb_ereg_replace($pattern, $repl, $str, $options);
    // ruleid: mb-ereg-replace-eval
    mb_ereg_replace($pattern, $repl, $str, $_GET['opt']);

    // ok: mb-ereg-replace-eval
    mb_ereg_replace($pattern, $repl, $str, "e");
    // ok: mb-ereg-replace-eval
    mb_ereg_replace($pattern, $repl, $str, 'msr');
    // ok: mb-ereg-replace-eval
    mb_ereg_replace($pattern, $repl, $str);
}
