<?php
/* CWE-497: Exposure of Sensitive System Information.
 *
 * phpinfo() prints the full configuration: absolute paths, loaded extensions
 * and their versions, environment variables - which is where database
 * passwords and API keys live in a containerised app - and the contents of
 * every superglobal. Left in a deployed file it is a reconnaissance endpoint
 * with no authentication on it.
 */

function debug_page($section)
{
    /* ruleid: phpinfo-use */
    phpinfo();
    /* ruleid: phpinfo-use */
    phpinfo(INFO_ENVIRONMENT);
    /* ruleid: phpinfo-use */
    phpinfo($section);

    /* ok: phpinfo-use */
    echo PHP_VERSION;
    /* ok: phpinfo-use */
    error_log(phpversion());
}
