<?php
// A nonce check that never fails the request is decoration: passing false
// (or 0) as the third argument keeps the handler running for forged calls.

function handle_save()
{
    // ruleid: wp-csrf-audit
    check_ajax_referer('save_nonce', 'nonce', false);
    // ruleid: wp-csrf-audit
    check_ajax_referer('save_nonce', 'nonce', 0);

    // ok: wp-csrf-audit
    check_ajax_referer('save_nonce', 'nonce', true);
    // ok: wp-csrf-audit
    check_ajax_referer('save_nonce', 'nonce');
}
