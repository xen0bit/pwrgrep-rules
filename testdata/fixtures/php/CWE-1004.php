<?php
/* CWE-1004: Sensitive Cookie Without HttpOnly Flag.
 *
 * Without HttpOnly a cookie is readable from document.cookie, so any script
 * that runs on the page - injected, or arriving through a dependency - can
 * read the session and send it elsewhere. It is the flag that turns an XSS
 * into an account takeover, and setting it costs one argument.
 */

function login($session_id, $token)
{
    /* ruleid: php-cookie-without-httponly */
    setcookie('session', $session_id);
    /* ruleid: php-cookie-without-httponly */
    setcookie('session', $session_id, time() + 3600);
    /* ruleid: php-cookie-without-httponly */
    setcookie('session', $session_id, time() + 3600, '/', '', true, false);
    /* ruleid: php-cookie-without-httponly */
    setcookie('remember', $token, ['expires' => time() + 86400, 'secure' => true]);
    /* ruleid: php-cookie-without-httponly */
    setrawcookie('session', $session_id, time() + 3600, '/');

    /* ok: php-cookie-without-httponly */
    setcookie('session', $session_id, time() + 3600, '/', '', true, true);
    /* ok: php-cookie-without-httponly */
    setcookie('remember', $token, [
        'expires' => time() + 86400,
        'secure' => true,
        'httponly' => true,
        'samesite' => 'Lax',
    ]);
    /* ok: php-cookie-without-httponly */
    session_set_cookie_params(['httponly' => true, 'secure' => true]);
}
