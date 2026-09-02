<?php
/* CWE-798: Use of Hard-coded Credentials.
 *
 * A secret in the source is in every deploy of it, in the repository's whole
 * history, and in any backup of the document root - which on a
 * misconfigured server is served as plain text. It cannot be rotated without
 * a release.
 */

/* ruleid: php-hardcoded-credential */
define('DB_PASSWORD', 'hunter2trustno1');
/* ruleid: php-hardcoded-credential */
const API_TOKEN = 'ghp_16C7e42F292c6912E7710c838347Ae178B4a';

class Connection
{
    /* ruleid: php-hardcoded-credential */
    private $password = 'correct-horse-battery';
    /* ruleid: php-hardcoded-credential */
    public static $apiKey = 'sk_live_51H8fJ2KpQ9vXnZ3mLb7T';

    public function connect($host)
    {
        /* ruleid: php-hardcoded-credential */
        $secret = 'aG9yc2ViYXR0ZXJ5c3RhcGxl';
        /* ruleid: php-hardcoded-credential */
        $config = ['user' => 'app', 'password' => 's3kr1t-passphrase'];

        /* ok: php-hardcoded-credential */
        $fromEnv = getenv('DB_PASSWORD');
        /* ok: php-hardcoded-credential */
        $empty = '';
        /* ok: php-hardcoded-credential */
        $prompt = 'Please enter your password';
        /* ok: php-hardcoded-credential */
        $format = 'password=%s';
        /* ok: php-hardcoded-credential */
        $redacted_password = 'PASSWORD';
        /* ok: php-hardcoded-credential */
        $api_key = 'YOUR_API_KEY_HERE';

        return [$secret, $config, $fromEnv, $empty, $prompt, $format,
                $redacted_password, $api_key];
    }
}
