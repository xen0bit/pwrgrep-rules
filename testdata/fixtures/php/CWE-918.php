<?php
/* CWE-918: Server-Side Request Forgery.
 *
 * The server fetches a URL the request chose. From inside the network that
 * URL reaches things the client cannot: 169.254.169.254 for cloud instance
 * credentials, 127.0.0.1 for the admin interface, and file:// for the disk.
 * A blocklist of hostnames does not close it - DNS can be made to answer with
 * a private address after the check.
 */

function fetch($id)
{
    $url = $_GET['url'];

    /* ruleid: php-ssrf */
    $body = file_get_contents($url);
    /* ruleid: php-ssrf */
    $lines = file($_POST['feed']);
    /* ruleid: php-ssrf */
    readfile($_REQUEST['doc']);
    /* ruleid: php-ssrf */
    $img = getimagesize($url);
    /* ruleid: php-ssrf */
    curl_setopt($ch, CURLOPT_URL, $url);
    /* ruleid: php-ssrf */
    $h = fopen($_GET['target'], 'r');

    /* ok: php-ssrf */
    $config = file_get_contents('/etc/app/config.json');
    /* ok: php-ssrf */
    $home = file_get_contents("https://api.example.com/items/" . (int)$id);
    /* ok: php-ssrf */
    curl_setopt($ch, CURLOPT_URL, 'https://api.example.com/health');
    /* ok: php-ssrf */
    $local = fopen(__DIR__ . '/template.html', 'r');

    return [$body, $lines, $img, $h, $config, $home, $local];
}
