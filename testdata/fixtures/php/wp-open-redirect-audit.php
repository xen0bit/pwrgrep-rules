<?php
// Audit: this helper sends a Location header. Flag every use; review each
// for user-supplied destinations.

function handle_go($target, $code)
{
    // ruleid: wp-open-redirect-audit
    wp_redirect($target);
    // ruleid: wp-open-redirect-audit
    wp_redirect($target, $code);

    // ok: wp-open-redirect-audit
    home_url($target);
    // ok: wp-open-redirect-audit
    strlen($target);
}
