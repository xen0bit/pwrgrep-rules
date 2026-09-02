<?php
/* CWE-94: Improper Control of Generation of Code.
 *
 * assert() with a string argument compiled and ran it as PHP for the whole of
 * PHP 5 and 7 - it was eval with an if around it. The behaviour is gone in
 * PHP 8, but code written against it is still deployed on 7, where a variable
 * reaching assert() is a variable reaching eval().
 */

function verify($input, $expected)
{
    /* ruleid: assert-use-audit */
    assert($input);
    /* ruleid: assert-use-audit */
    assert($_GET['check']);
    /* ruleid: assert-use-audit */
    assert($input->expr);

    /* ok: assert-use-audit */
    assert('1 === 1');
    /* ok: assert-use-audit */
    assert($input === $expected);
    /* ok: assert-use-audit */
    assert(is_string($input));
}
