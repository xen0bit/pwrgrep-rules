<?php
// Audit: unserializing request data instantiates attacker-chosen classes.
// Flag every use; review each for proper sanitization.

function handle_object($input, $allowed)
{
    // ruleid: wp-php-object-injection-audit
    unserialize($input);
    // ruleid: wp-php-object-injection-audit
    maybe_unserialize($input);
    // ruleid: wp-php-object-injection-audit
    unserialize($input, $allowed);

    // ok: wp-php-object-injection-audit
    serialize($input);
    // ok: wp-php-object-injection-audit
    json_decode($input);
}
