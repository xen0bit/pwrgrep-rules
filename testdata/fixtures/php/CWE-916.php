<?php
/* CWE-916: Use of Password Hash With Insufficient Computational Effort.
 *
 * MD5 and SHA-1 are fast, which is the whole problem: a GPU tries billions of
 * candidates a second against them, so a stolen table of md5 password hashes
 * is a stolen table of passwords. password_hash() is deliberately slow and
 * salted, and password_verify() checks it.
 */

function register($username, $password)
{
    /* ruleid: md5-used-as-password */
    $hash = md5($password);
    /* ruleid: md5-used-as-password */
    $legacy_pwd_hash = sha1($password);
    /* ruleid: md5-used-as-password */
    $alt = hash('md5', $_POST['passwd']);
    /* ruleid: md5-used-as-password */
    $salted = md5($salt . $password);

    /* ruleid: md5-used-as-password */
    $password_hash = md5($input);

    /* ok: md5-used-as-password */
    $proper = password_hash($password, PASSWORD_DEFAULT);
    /* ok: md5-used-as-password */
    $etag = md5($username);
    /* ok: md5-used-as-password */
    $checksum = hash('sha256', file_get_contents('/tmp/x'));
    /* ok: md5-used-as-password */
    $derived = hash_pbkdf2('sha256', $password, $salt, 100000);

    return [$hash, $legacy_pwd_hash, $alt, $salted, $password_hash,
            $proper, $etag, $checksum, $derived];
}
