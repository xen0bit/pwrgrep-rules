<?php
// Audit: $wpdb helpers that interpolate (rather than prepare) run raw SQL.
// Flag the interpolating calls; prepared statements and writes stay quiet.

function handle_rows($id, $table)
{
    global $wpdb;
    // ruleid: wp-sql-injection-audit
    $wpdb->query("SELECT * FROM t WHERE id = " . $id);
    // ruleid: wp-sql-injection-audit
    $wpdb->get_results("SELECT * FROM " . $table);
    // ruleid: wp-sql-injection-audit
    $wpdb->get_var("SELECT COUNT(*) FROM " . $table);

    // ok: wp-sql-injection-audit
    $wpdb->prepare("SELECT * FROM t WHERE id = %d", $id);
    // ok: wp-sql-injection-audit
    $wpdb->insert("t", ["id" => $id]);
}
