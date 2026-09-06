<?php
// CWE-611: XXE
function vuln($xml) {
    // ruleid: php-xxe
    $a = simplexml_load_string($xml);
    // ruleid: php-xxe
    $b = simplexml_load_file($xml);
    // ruleid: php-xxe
    libxml_disable_entity_loader(false);
}
function safe() {
    // ok: php-xxe
    $a = simplexml_load_string("<root>fixed</root>");
    // ok: php-xxe
    $b = simplexml_load_file("/tmp/fixed.xml");
    // ok: php-xxe
    libxml_disable_entity_loader(true);
}
