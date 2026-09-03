<?php
/* CWE-89: SQL Injection.
 *
 * PHP has no query type, so a query is a string and the templating is
 * concatenation or interpolation. Either way the database receives one string
 * and cannot tell which half the program wrote. A prepared statement is not a
 * quoting convention: the value never becomes part of the statement at all,
 * so there is no quoting to get wrong.
 */

function lookup($pdo, $mysqli, $conn, $wpdb, $name, $id)
{
    /* ruleid: php-sql-built-by-concatenation */
    $mysqli->query("SELECT * FROM users WHERE name = '" . $name . "'");
    /* ruleid: php-sql-built-by-concatenation */
    $pdo->exec("DELETE FROM sessions WHERE id = $id");
    /* ruleid: php-sql-built-by-concatenation */
    mysqli_query($conn, "UPDATE t SET v = '{$name}' WHERE k = 1");
    /* ruleid: php-sql-built-by-concatenation */
    $wpdb->get_results("SELECT * FROM wp_posts WHERE post_title = '$name'");

    $sql = "SELECT * FROM users WHERE email = '" . $_GET['email'] . "'";
    /* ruleid: php-sql-built-by-concatenation */
    $rows = $pdo->query($sql);

    /* ok: php-sql-built-by-concatenation */
    $stmt = $pdo->prepare('SELECT * FROM users WHERE name = ?');
    $stmt->execute([$name]);
    /* ok: php-sql-built-by-concatenation */
    $mysqli->query('SELECT COUNT(*) FROM users');
    /* ok: php-sql-built-by-concatenation */
    mysqli_query($conn, "SELECT id FROM users ORDER BY id");
    /* ok: php-sql-built-by-concatenation */
    $wpdb->get_results($wpdb->prepare("SELECT * FROM wp_posts WHERE ID = %d", $id));

    return [$rows, $stmt];
}
