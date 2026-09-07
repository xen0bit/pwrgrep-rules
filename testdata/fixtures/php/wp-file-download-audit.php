<?php
// Audit: these helpers read file contents. Flag every use; review each for
// user-controlled paths.

function handle_download($path)
{
    // ruleid: wp-file-download-audit
    file($path);
    // ruleid: wp-file-download-audit
    file_get_contents($path);
    // ruleid: wp-file-download-audit
    readfile($path);

    // ok: wp-file-download-audit
    file_exists($path);
    // ok: wp-file-download-audit
    strlen($path);
}
