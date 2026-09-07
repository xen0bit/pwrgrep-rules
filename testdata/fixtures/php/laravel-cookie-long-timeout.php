<?php
// Long-lived session cookies widen the window a stolen token stays usable.
// Lifetimes over 30 minutes are flagged; short and env-driven ones are not.

// ruleid: laravel-cookie-long-timeout
return [
    'cookie' => env('SESSION_COOKIE'),
    'lifetime' => 120,
];

// ruleid: laravel-cookie-long-timeout
return [
    'cookie' => env('SESSION_COOKIE'),
    'lifetime' => 60,
];

// ok: laravel-cookie-long-timeout
return [
    'cookie' => env('SESSION_COOKIE'),
    'lifetime' => 30,
];

// ok: laravel-cookie-long-timeout
return [
    'cookie' => env('SESSION_COOKIE'),
    'lifetime' => env('SESSION_LIFETIME', 120),
];
