<?php
/* CWE-601: URL Redirection to Untrusted Site.
 *
 * Redirecting to the request's own URI looks like it cannot leave the site,
 * and it can: a browser asked for //evil.example.com/x sends REQUEST_URI as
 * //evil.example.com/x, and a Location header beginning with two slashes is
 * a protocol-relative URL to another host.
 */

function bounce()
{
    /* ruleid: redirect-to-request-uri */
    header('Location: ' . $_SERVER['REQUEST_URI']);
    /* ruleid: redirect-to-request-uri */
    header('Location: ' . $_SERVER['REQUEST_URI'] . '?done=1');

    /* ok: redirect-to-request-uri */
    header('Location: /dashboard');
    /* ok: redirect-to-request-uri */
    header('Location: https://example.com/dashboard');
}
