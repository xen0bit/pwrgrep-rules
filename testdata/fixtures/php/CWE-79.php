<?php
/* CWE-79: Cross-site Scripting.
 *
 * A request parameter written into the response is markup the request wrote.
 * PHP's output has no context of its own - echo puts bytes where they land -
 * so the escaping has to be done at the point of output, and
 * htmlspecialchars with ENT_QUOTES is the one that covers attribute values
 * as well as text.
 */

function show($rows)
{
    /* ruleid: php-reflected-superglobal */
    echo $_GET['q'];
    /* ruleid: php-reflected-superglobal */
    echo "<div>" . $_POST['comment'] . "</div>";
    /* ruleid: php-reflected-superglobal */
    echo "<p>{$_REQUEST['msg']}</p>";
    /* ruleid: php-reflected-superglobal */
    print $_COOKIE['last'];
    /* ruleid: php-reflected-superglobal */
    echo '<a title="' . $_GET['t'] . '">x</a>';

    /* ok: php-reflected-superglobal */
    echo htmlspecialchars($_GET['q'], ENT_QUOTES, 'UTF-8');
    /* ok: php-reflected-superglobal */
    echo "<div>" . htmlentities($_POST['comment']) . "</div>";
    /* ok: php-reflected-superglobal */
    echo (int) $_GET['page'];
    /* ok: php-reflected-superglobal */
    echo "<p>no input here</p>";
    /* ok: php-reflected-superglobal */
    echo count($rows);
}
?>
<!-- ruleid: php-reflected-superglobal -->
<div><?= $_GET['name'] ?></div>
<!-- ok: php-reflected-superglobal -->
<div><?= htmlspecialchars($_GET['name'], ENT_QUOTES) ?></div>
