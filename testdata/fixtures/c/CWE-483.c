/* CWE-483: Incorrect Block Delimitation.
 *
 * An if without braces guards one statement. A second one indented to match
 * it is not guarded by anything, and runs every time - which is how Apple's
 * TLS certificate check came to skip its final verification step in 2014.
 */
#include <stdio.h>

int verify(int ok, int extra)
{
    int err = 0;

    /* ruleid: double_goto */
    if (!ok)
        goto fail;
        goto fail;

    if (!extra)
        goto fail;

    /* ok: double_goto */
    if (err != 0) {
        goto fail;
    }

    /* ok: double_goto */
    if (!ok)
        goto fail;

    return 0;
fail:
    return err;
}
