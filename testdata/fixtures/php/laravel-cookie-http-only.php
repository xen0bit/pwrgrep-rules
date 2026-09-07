<?php
// Session cookies without HttpOnly are readable from JavaScript, which turns
// any XSS into session theft. Arrays missing the flag are flagged.

// ruleid: laravel-cookie-http-only
return [
    'cookie' => env('SESSION_COOKIE'),
    'http_only' => false,
];

// ruleid: laravel-cookie-http-only
return [
    'cookie' => env('SESSION_COOKIE'),
    'secure' => true,
];

// ok: laravel-cookie-http-only
return [
    'cookie' => env('SESSION_COOKIE'),
    'http_only' => true,
];

// ok: laravel-cookie-http-only
return [
    'cookie' => env('SESSION_COOKIE'),
    'http_only' => env('SESSION_HTTP_ONLY', false),
];
