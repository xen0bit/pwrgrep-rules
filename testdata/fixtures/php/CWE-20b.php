<?php
// CWE-20b: Improper Input Validation — $_GET reaching query/exec without filter_var/preg_match

$id = $_GET['id'];
$query = "SELECT * FROM users WHERE id=" . $id;
// ruleid: php-20-strict
$db->query($query);

$cmd = $_GET['cmd'];
// ruleid: php-20-strict
exec($cmd);

$page = $_REQUEST['page'];
// ruleid: php-20-strict
mysqli_query($conn, "SELECT * FROM pages WHERE name='$page'");

$clean = filter_var($_GET['id'], FILTER_VALIDATE_INT);
if ($clean !== false) {
    // ok: php-20-strict
    $db->query("SELECT * FROM users WHERE id=$clean");
}

$input = filter_var($_GET['input'], FILTER_SANITIZE_STRING);
// ok: php-20-strict
exec($input);
