<?php
/* CWE-327: Use of a Broken or Risky Cryptographic Algorithm.
 *
 * MD5 and SHA-1 have practical collisions, crypt() without an explicit
 * modern salt falls back to DES, and str_rot13 is not encryption at all.
 * Which of these is fatal depends on what the value is for, and nothing in
 * the call says - so the call is what gets reported.
 */

function digest($data, $file, $password)
{
    /* ruleid: weak-crypto */
    $a = md5($data);
    /* ruleid: weak-crypto */
    $b = sha1($data);
    /* ruleid: weak-crypto */
    $c = md5_file($file);
    /* ruleid: weak-crypto */
    $d = sha1_file($file);
    /* ruleid: weak-crypto */
    $e = crypt($password);
    /* ruleid: weak-crypto */
    $f = str_rot13($data);

    /* ok: weak-crypto */
    $g = hash('sha256', $data);
    /* ok: weak-crypto */
    $h = password_hash($password, PASSWORD_DEFAULT);
    /* ok: weak-crypto */
    $i = hash_hmac('sha256', $data, $key);

    return [$a, $b, $c, $d, $e, $f, $g, $h, $i];
}
