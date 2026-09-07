<?php
// Cookies without the secure flag travel over plain HTTP, where they can be
// sniffed. Arrays missing the flag are flagged; set and env-driven pass.

// ruleid: laravel-cookie-secure-set
return [
    'cookie' => env('SESSION_COOKIE'),
    'secure' => false,
];

// ruleid: laravel-cookie-secure-set
return [
    'cookie' => env('SESSION_COOKIE'),
    'http_only' => true,
];

// ok: laravel-cookie-secure-set
return [
    'cookie' => env('SESSION_COOKIE'),
    'secure' => true,
];

// ok: laravel-cookie-secure-set
return [
    'cookie' => env('SESSION_COOKIE'),
    'secure' => env('SESSION_SECURE_COOKIE'),
];
