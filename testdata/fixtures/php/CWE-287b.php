<?php
// CWE-287: Improper Authentication — session check missing before superglobal use
// Vulnerable code uses $_GET/$_POST directly; safe code guards with isset($_SESSION['user']).

// ruleid: php-missing-auth
$id = $_GET['id'];
echo "user $id";

// ruleid: php-missing-auth
$user = $_POST['user'];
$query = "SELECT * FROM users WHERE id=" . $user;

// ruleid: php-missing-auth
$action = $_REQUEST['action'];
include($action . ".php");

// ok: php-missing-auth
if (isset($_SESSION['user'])) {
    $id = $_GET['id'];
    echo "user $id";
}

// ok: php-missing-auth
if (isset($_SESSION['user'])) {
    $user = $_POST['user'];
    echo $user;
}

// ok: php-missing-auth — no superglobal, public page
echo "public content";
