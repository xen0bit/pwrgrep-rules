<?php
/* CWE-330: Use of Insufficiently Random Values.
 *
 * mt_rand is a Mersenne Twister: 624 consecutive outputs recover the whole
 * state, and the state gives every output before and after. uniqid() is
 * worse - it is the clock in hexadecimal, so the next one is guessable from
 * the last. random_bytes and random_int are the CSPRNG and are no harder to
 * call.
 */

function issue($user)
{
    /* ruleid: php-insecure-randomness */
    $token = mt_rand(0, PHP_INT_MAX);
    /* ruleid: php-insecure-randomness */
    $reset_password_key = uniqid();
    /* ruleid: php-insecure-randomness */
    $csrf_token = md5(rand());
    /* ruleid: php-insecure-randomness */
    $salt = str_shuffle('abcdefghijklmnopqrstuvwxyz');
    /* ruleid: php-insecure-randomness */
    $api_secret = uniqid('', true);

    /* ok: php-insecure-randomness */
    $good_token = bin2hex(random_bytes(32));
    /* ok: php-insecure-randomness */
    $good_key = random_int(0, PHP_INT_MAX);
    /* ok: php-insecure-randomness */
    $delay = mt_rand(1, 5);
    /* ok: php-insecure-randomness */
    $pick = $user[array_rand($user)];

    return [$token, $reset_password_key, $csrf_token, $salt, $api_secret,
            $good_token, $good_key, $delay, $pick];
}
