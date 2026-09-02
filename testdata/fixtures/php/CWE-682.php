<?php
/* CWE-682: Incorrect Calculation.
 *
 * base_convert() works in 64-bit floats, so a number longer than about 15
 * digits comes back rounded. Fed a hash - which is what makes this a security
 * bug rather than an arithmetic one - it silently collapses the output into a
 * far smaller set of values, and a token built this way has a fraction of the
 * entropy it appears to.
 */

function token($seed)
{
    /* ruleid: base-convert-loses-precision */
    $t = base_convert(md5($seed), 16, 36);
    /* ruleid: base-convert-loses-precision */
    $u = base_convert(sha1($seed), 16, 36);
    /* ruleid: base-convert-loses-precision */
    $v = base_convert(hash('sha256', $seed), 16, 36);
    /* ruleid: base-convert-loses-precision */
    $w = base_convert(bin2hex(random_bytes(32)), 16, 36);

    /* ok: base-convert-loses-precision */
    $x = base_convert('ff', 16, 10);
    /* ok: base-convert-loses-precision */
    $y = base_convert(substr(md5($seed), 0, 7), 16, 36);
    /* ok: base-convert-loses-precision */
    $z = bin2hex(random_bytes(16));

    return [$t, $u, $v, $w, $x, $y, $z];
}
