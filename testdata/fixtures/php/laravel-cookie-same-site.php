<?php
// SameSite none (or an unset attribute) lets browsers attach the session
// cookie to cross-site requests. Only lax and strict (or env) stay quiet.

// ruleid: laravel-cookie-same-site
return [
    'cookie' => env('SESSION_COOKIE'),
    'same_site' => 'none',
];

// ruleid: laravel-cookie-same-site
return [
    'cookie' => env('SESSION_COOKIE'),
    'path' => '/',
];

// ok: laravel-cookie-same-site
return [
    'cookie' => env('SESSION_COOKIE'),
    'same_site' => 'lax',
];

// ok: laravel-cookie-same-site
return [
    'cookie' => env('SESSION_COOKIE'),
    'same_site' => 'strict',
];
