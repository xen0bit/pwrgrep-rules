<?php
// CWE-295b: TLS verification disabled via curl, stream_context_create, Guzzle
function fetch_curl($ch, $url) {
    // ruleid: php-295-strict
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    // ruleid: php-295-strict
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
}

function fetch_stream($url) {
    // ruleid: php-295-strict
    $ctx = stream_context_create(["ssl" => ["verify_peer" => false, "verify_peer_name" => false]]);
    return $ctx;
}

function safe_curl($ch, $url) {
    // ok: php-295-strict
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
}

function safe_guzzle() {
    // ok: php-295-strict
    $client = new GuzzleHttp\Client(["verify" => true]);
}
