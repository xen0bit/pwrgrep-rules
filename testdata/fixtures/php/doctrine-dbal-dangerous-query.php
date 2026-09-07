<?php
// Concatenating request input into a DBAL query string escapes the driver's
// quoting. Variable-built queries flag; full literals stay quiet.

use Doctrine\DBAL\Connection;

function handle_dbal($em, $id)
{
    $conn = $em->getConnection();
    // ruleid: doctrine-dbal-dangerous-query
    $conn->prepare("SELECT * FROM t WHERE id = " . $id);
    // ruleid: doctrine-dbal-dangerous-query
    $conn->executeQuery($id);
    // ruleid: doctrine-dbal-dangerous-query
    $conn->createQuery("SELECT t FROM T t WHERE t.id = " . $id, $id);

    // ok: doctrine-dbal-dangerous-query
    $conn->prepare("SELECT * FROM t WHERE id = 1");
    // ok: doctrine-dbal-dangerous-query
    $conn->executeQuery("SELECT * FROM t");
}
