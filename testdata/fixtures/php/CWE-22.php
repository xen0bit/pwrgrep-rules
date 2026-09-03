<?php
/* CWE-22: Path Traversal.
 *
 * A path the request chose is a path that may be "../". Writing through one
 * puts a file wherever the request said - a .php file in the web root will
 * do - and a directory prefix is a string, not a boundary.
 */

function save($data, $dir)
{
    /* ruleid: php-path-from-request */
    file_put_contents($_GET['file'], $data);
    /* ruleid: php-path-from-request */
    file_put_contents("uploads/" . $_POST['name'], $data);
    /* ruleid: php-path-from-request */
    move_uploaded_file($_FILES['f']['tmp_name'], "uploads/" . $_FILES['f']['name']);
    /* ruleid: php-path-from-request */
    rename($dir . '/staging.tmp', $_POST['to']);
    /* ruleid: php-path-from-request */
    mkdir("data/" . $_GET['bucket']);
    /* ruleid: php-path-from-request */
    $entries = scandir($_GET['dir']);

    /* ok: php-path-from-request */
    file_put_contents($dir . '/out.txt', $data);
    /* ok: php-path-from-request */
    move_uploaded_file($_FILES['f']['tmp_name'], "uploads/" . bin2hex(random_bytes(16)));
    /* ok: php-path-from-request */
    mkdir("data/" . basename($_GET['bucket']));
    /* ok: php-path-from-request */
    $all = scandir(__DIR__ . '/data');

    return [$entries, $all];
}
