<?php
// Audit: wp_ajax_* hooks expose custom endpoints; the nopriv variant answers
// without authentication. Flag every AJAX hook registration for review.

function register_endpoints()
{
    // ruleid: wp-ajax-no-auth-and-auth-hooks-audit
    add_action('wp_ajax_do_thing', 'handle_thing');
    // ruleid: wp-ajax-no-auth-and-auth-hooks-audit
    add_action('wp_ajax_nopriv_do_thing', 'handle_thing_public', 10, 2);
    // ruleid: wp-ajax-no-auth-and-auth-hooks-audit
    add_action('wp_ajax_export_rows', 'handle_export');

    // ok: wp-ajax-no-auth-and-auth-hooks-audit
    add_action('init', 'handle_init');
    // ok: wp-ajax-no-auth-and-auth-hooks-audit
    add_filter('the_content', 'filter_content');
}
