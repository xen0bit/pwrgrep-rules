<?php
// Audit: these checks gate privileged actions. Flag every use so a reviewer
// can confirm the capability fits the action.

function gate_action($post_id)
{
    // ruleid: wp-authorisation-checks-audit
    current_user_can('manage_options');
    // ruleid: wp-authorisation-checks-audit
    is_admin();
    // ruleid: wp-authorisation-checks-audit
    is_user_logged_in();

    // ok: wp-authorisation-checks-audit
    get_post($post_id);
    // ok: wp-authorisation-checks-audit
    strlen('is_admin');
}
