<?php
/* CWE-1104: Use of Unmaintained Third Party Components.
 *
 * The mcrypt extension was deprecated in PHP 7.1 and removed in 7.2. It had
 * been unmaintained upstream for a decade before that, and its default
 * padding - NUL bytes, not PKCS#7 - silently truncates data that ends in
 * zeros. openssl_encrypt is the replacement.
 */

function encrypt_legacy($data, $key, $iv)
{
    /* ruleid: mcrypt-use */
    $c = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, $iv);
    /* ruleid: mcrypt-use */
    $p = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $c, MCRYPT_MODE_CBC, $iv);
    /* ruleid: mcrypt-use */
    $s = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
    /* ruleid: mcrypt-use */
    $m = mdecrypt_generic($td, $c);

    /* ok: mcrypt-use */
    $n = openssl_encrypt($data, 'aes-256-gcm', $key, 0, $iv, $tag);
    /* ok: mcrypt-use */
    $o = openssl_decrypt($n, 'aes-256-gcm', $key, 0, $iv, $tag);

    return [$c, $p, $s, $m, $n, $o];
}
