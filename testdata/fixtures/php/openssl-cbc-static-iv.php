<?php
// A hardcoded IV reuses the keystream across messages: identical plaintext
// blocks encrypt identically. Random per-message IVs and non-CBC modes stay
// quiet.

function handle_crypto($data, $key, $iv)
{
    // ruleid: openssl-cbc-static-iv
    openssl_encrypt($data, "AES-256-CBC", $key, 0, "0123456789abcdef");
    // ruleid: openssl-cbc-static-iv
    openssl_decrypt($data, "AES-128-CBC", $key, 0, 'static-iv-0123456');

    // ok: openssl-cbc-static-iv
    openssl_encrypt($data, "AES-256-CBC", $key, 0, $iv);
    // ok: openssl-cbc-static-iv
    openssl_encrypt($data, "AES-256-GCM", $key, 0, "static-iv-0123456");
    // ok: openssl-cbc-static-iv
    openssl_encrypt($data, "AES-256-CBC", $key);
}
