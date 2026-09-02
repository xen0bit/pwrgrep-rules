<?php
/* CWE-98: Improper Control of Filename for Include/Require.
 *
 * include runs what it loads. A request that chooses the path chooses which
 * PHP executes, and it does not have to be a .php file: an uploaded avatar,
 * a log line the attacker wrote, /proc/self/environ. With allow_url_include
 * on it does not have to be a local file at all.
 */

function route($page)
{
    /* ruleid: php-include-from-request */
    include $_GET['page'];
    /* ruleid: php-include-from-request */
    include_once($_GET['module'] . '.php');
    /* ruleid: php-include-from-request */
    require "pages/" . $_REQUEST['name'] . ".php";
    /* ruleid: php-include-from-request */
    require_once($_POST['tpl']);

    /* ok: php-include-from-request */
    include __DIR__ . '/pages/home.php';
    /* ok: php-include-from-request */
    require_once 'vendor/autoload.php';
    /* ok: php-include-from-request */
    include "pages/" . basename($page) . ".php";
}
