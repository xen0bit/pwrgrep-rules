<?php
/* CWE-697: Incorrect Comparison.
 *
 * PHP's == compares two strings that both look like numbers as numbers, and
 * "0e12345" is scientific notation for zero. Roughly one md5 hash in 340
 * renders as 0e followed by digits, so `md5($guess) == $stored` is true for
 * any two such hashes - and a handful of well-known inputs produce them.
 */

function check($given, $stored, $file)
{
    /* ruleid: md5-loose-equality */
    if (md5($given) == $stored) {
        return true;
    }
    /* ruleid: md5-loose-equality */
    if ($stored == md5($given)) {
        return true;
    }
    /* ruleid: md5-loose-equality */
    if (md5($given) == md5($stored)) {
        return true;
    }
    /* ruleid: md5-loose-equality */
    if (md5_file($file) == $stored) {
        return true;
    }

    /* ok: md5-loose-equality */
    if (md5($given) === $stored) {
        return true;
    }
    /* ok: md5-loose-equality */
    if (hash_equals($stored, md5($given))) {
        return true;
    }
    /* ok: md5-loose-equality */
    return $given === $stored;
}
