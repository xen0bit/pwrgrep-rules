<?php
// Audit: including a request-chosen path runs it as PHP. Flag every loader;
// review each path for user control.

function handle_template($name, $fallback, $fp)
{
    // ruleid: wp-file-inclusion-audit
    include($name);
    // ruleid: wp-file-inclusion-audit
    require_once($fallback);
    // ruleid: wp-file-inclusion-audit
    fread($fp, 1024);
    // ruleid: wp-file-inclusion-audit
    include $name;

    // ok: wp-file-inclusion-audit
    file_exists($name);
    // ok: wp-file-inclusion-audit
    strlen($fallback);
}
