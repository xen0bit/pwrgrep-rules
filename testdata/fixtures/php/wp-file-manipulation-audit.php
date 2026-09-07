<?php
// Audit: these helpers delete files. Flag every use; review each for
// user-controlled paths.

function handle_delete($path)
{
    // ruleid: wp-file-manipulation-audit
    unlink($path);
    // ruleid: wp-file-manipulation-audit
    wp_delete_file($path, true);

    // ok: wp-file-manipulation-audit
    file_exists($path);
    // ok: wp-file-manipulation-audit
    strlen($path);
    // ruleid: wp-file-manipulation-audit
    unlink($path . '.bak');
    // ok: wp-file-manipulation-audit
    trim($path);
}
