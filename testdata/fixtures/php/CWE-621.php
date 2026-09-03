<?php
/* CWE-621: Variable Extraction Error.
 *
 * extract() turns array keys into local variables, so extract($_POST) lets
 * the request name the variables in the function. It can overwrite one that
 * already exists - $is_admin, $user, the $config the file just loaded - and
 * the assignment happens before any of the code that reads them.
 */

function handle($row)
{
    /* ruleid: extract-user-data */
    extract($_POST);
    /* ruleid: extract-user-data */
    extract($_GET);
    /* ruleid: extract-user-data */
    extract($_REQUEST, EXTR_OVERWRITE);
    /* ruleid: extract-user-data */
    extract($_FILES);

    /* ok: extract-user-data */
    extract($row);
    /* ok: extract-user-data */
    extract($_POST, EXTR_SKIP);
    /* ok: extract-user-data */
    extract($_GET, EXTR_PREFIX_ALL, 'in');
}
