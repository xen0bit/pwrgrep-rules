<?php
/* CWE-22: Path Traversal with taint.
 *
 * A path from the request may contain ../ and escape the intended directory.
 */

function handle($dir, $data)
{
    /* ruleid: php-path-traversal */
    file_put_contents($_GET['file'], $data);
    $p = $_POST['name'];
    /* ruleid: php-path-traversal */
    file_put_contents("uploads/" . $p, $data);
    $out = $_REQUEST['path'];
    /* ruleid: php-path-traversal */
    $fh = fopen($out, "w");
    /* ruleid: php-path-traversal */
    mkdir("data/" . $_GET['bucket']);
    /* ruleid: php-path-traversal */
    unlink($_COOKIE['file']);

    /* ok: php-path-traversal */
    $fixed = __DIR__ . '/safe.txt';
    file_put_contents($fixed, $data);
    /* ok: php-path-traversal */
    file_put_contents("uploads/" . bin2hex(random_bytes(16)), $data);
    /* ok: php-path-traversal */
    $fixed = __DIR__ . '/data/out.txt';
    file_put_contents($fixed, $data);
}
