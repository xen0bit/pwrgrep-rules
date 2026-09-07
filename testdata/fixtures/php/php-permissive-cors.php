<?php
// A wildcard ACAO header lets any origin read the response. Only the
// star-origin form flags; scoped origins and other headers stay quiet.

function send_cors($origin)
{
    // ruleid: php-permissive-cors
    header("Access-Control-Allow-Origin: *");
    // ruleid: php-permissive-cors
    header('Access-Control-Allow-Origin: *');

    // ok: php-permissive-cors
    header("Access-Control-Allow-Origin: https://example.com");
    // ok: php-permissive-cors
    header("X-Frame-Options: DENY");
}
