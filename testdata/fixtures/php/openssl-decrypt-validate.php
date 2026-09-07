<?php
// Audit: openssl_decrypt returns the plaintext or false. Every call is
// listed so the reviewer can confirm the result is compared against false;
// other primitives stay quiet.

function handle_decrypt($data, $method, $key, $iv)
{
    // ruleid: openssl-decrypt-validate
    $a = openssl_decrypt($data, $method, $key);
    // ruleid: openssl-decrypt-validate
    $b = openssl_decrypt($data, $method, $key, 0, $iv);
    // ruleid: openssl-decrypt-validate
    $c = openssl_decrypt($data, $method, $key);
    if ($c === false) {
        echo "bad";
    }

    // ok: openssl-decrypt-validate
    $d = openssl_encrypt($data, $method, $key, 0, $iv);
    // ok: openssl-decrypt-validate
    $e = hash('sha256', $data);
}
