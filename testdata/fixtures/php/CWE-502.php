<?php
/* CWE-502: Deserialization of Untrusted Data.
 *
 * unserialize() builds objects of whatever class the string names, and PHP
 * then calls that object's __wakeup and __destruct. An attacker who can
 * choose the class chooses which of those runs, and a "POP chain" through the
 * classes an application already loads reaches file writes and command
 * execution without any of those classes containing a bug.
 */

function restore($blob, $id)
{
    /* ruleid: unserialize-use */
    $session = unserialize($_COOKIE['session']);
    /* ruleid: unserialize-use */
    $data = unserialize($blob);
    /* ruleid: unserialize-use */
    $prefs = unserialize($blob, ['allowed_classes' => true]);
    /* ruleid: unserialize-use */
    $meta = maybe_unserialize($_POST['meta']);

    /* ok: unserialize-use */
    $safe = unserialize($blob, ['allowed_classes' => false]);
    /* ok: unserialize-use */
    $safer = unserialize($blob, ['allowed_classes' => ['Prefs']]);
    /* ok: unserialize-use */
    $json = json_decode($blob, true);

    return [$session, $data, $prefs, $meta, $safe, $safer, $json, $id];
}
