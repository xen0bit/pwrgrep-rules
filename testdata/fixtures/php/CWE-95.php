<?php
/* CWE-95: Improper Neutralization of Directives in Dynamically Evaluated Code.
 *
 * eval() compiles its argument as PHP and runs it in the current scope, with
 * the current includes, the current database handle and the current session.
 * There is no sandbox and no partial version of this: a string that reaches
 * eval is the program.
 */

function render($template, $rows)
{
    /* ruleid: eval-use */
    eval($template);
    /* ruleid: eval-use */
    eval($_GET['code']);
    /* ruleid: eval-use */
    eval('return ' . $template . ';');
    /* ruleid: eval-use */
    eval("return {$template};");

    /* ok: eval-use */
    eval('return 1 + 1;');
    /* ok: eval-use */
    eval("return null;");

    return $rows;
}
