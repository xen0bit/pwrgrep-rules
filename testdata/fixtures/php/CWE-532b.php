<?php
// CWE-532b: Sensitive info into log — password reaches error_log/logger.
$password = $_POST['password'];
$secret = $_GET['secret'];
$api_key = "should_not_log_but_test";

function leak($password, $secret) {
    // ruleid: php-log
    error_log($password);
    // ruleid: php-log
    error_log("password=" . $password);
    // ruleid: php-log
    $logger->info($secret);
    // ruleid: php-log
    $logger->debug($api_key);
}

function safe() {
    // ok: php-log
    error_log("user logged in");
    // ok: php-log
    $logger->info("request processed");
    // ok: php-log
    error_log("redacted");
}
?>
