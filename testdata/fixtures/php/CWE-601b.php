<?php
// CWE-601: Open Redirect via header Location with $_GET
function vuln1() {
    $url = $_GET['next'];
    // ruleid: php-open-redirect
    header('Location: ' . $url);
}

function vuln2() {
    // ruleid: php-open-redirect
    header('Location: ' . $_GET['url']);
}

function vuln3() {
    $target = $_POST['target'];
    // ruleid: php-open-redirect
    header('Location: ' . $target);
}

function safeLiteral() {
    // ok: php-open-redirect
    header('Location: /home');
}

function safeAllowlist() {
    $url = $_GET['next'];
    if ($url == '/home' || $url == '/dashboard') {
        // ok: php-open-redirect
        header('Location: /home');
    }
}
?>
