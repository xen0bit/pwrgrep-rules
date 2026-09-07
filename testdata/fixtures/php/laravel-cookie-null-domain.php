<?php
// A hardcoded cookie domain scopes the session to that host; a null domain
// (or an env-provided one) lets the framework decide. Fixed strings flag.

// ruleid: laravel-cookie-null-domain
return [
    'cookie' => env('SESSION_COOKIE'),
    'domain' => 'example.com',
];

// ruleid: laravel-cookie-null-domain
return [
    'cookie' => env('SESSION_COOKIE'),
    'domain' => '.example.com',
];

// ok: laravel-cookie-null-domain
return [
    'cookie' => env('SESSION_COOKIE'),
    'domain' => null,
];

// ok: laravel-cookie-null-domain
return [
    'cookie' => env('SESSION_COOKIE'),
    'domain' => env('SESSION_DOMAIN'),
];
