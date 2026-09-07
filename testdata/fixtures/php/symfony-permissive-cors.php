<?php
// A wildcard ACAO header lets any origin read the response. Only the
// star-origin set() form flags; scoped values and other headers pass.

use Symfony\Component\HttpFoundation\Response;

function send_headers($res, $origin)
{
    // ruleid: symfony-permissive-cors
    $res->headers->set('Access-Control-Allow-Origin', '*');
    // ruleid: symfony-permissive-cors
    $res->headers->set("Access-Control-Allow-Origin", "*");

    // ok: symfony-permissive-cors
    $res->headers->set('Access-Control-Allow-Origin', $origin);
    // ok: symfony-permissive-cors
    $res->headers->set('X-Frame-Options', 'DENY');
}
