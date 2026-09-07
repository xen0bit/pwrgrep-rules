<?php
// Leaving the debug flag on in production leaks stack traces and config.
// Each spelling that enables it is flagged; disabled values stay quiet.

function enable_debug()
{
    // ruleid: laravel-active-debug-code
    putenv("APP_DEBUG=true");
    // ruleid: laravel-active-debug-code
    config(['app.debug' => 'true']);
    // ruleid: laravel-active-debug-code
    $_ENV["APP_DEBUG"] = 'true';

    // ok: laravel-active-debug-code
    putenv("APP_DEBUG=false");
    // ok: laravel-active-debug-code
    config(['app.debug' => 'false']);
    // ok: laravel-active-debug-code
    $_ENV["APP_DEBUG"] = 'false';
}
