<?php
/* CWE-73: External Control of File Name or Path.
 *
 * unlink() removes whatever path it is given. A path the request decided is a
 * request that chooses which file to delete, and "../" is a character
 * sequence PHP has no opinion about.
 */

function cleanup($name, $id)
{
    /* ruleid: unlink-use */
    unlink($_GET['file']);
    /* ruleid: unlink-use */
    unlink("/var/cache/" . $name);
    /* ruleid: unlink-use */
    unlink("/var/cache/{$id}.tmp");
    /* ruleid: unlink-use */
    unlink($name);

    /* ok: unlink-use */
    unlink('/var/cache/index.lock');
    /* ok: unlink-use */
    unlink("/tmp/build.pid");
    /* ok: unlink-use */
    unlink(basename($name));
}
