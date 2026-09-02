<?php
/* CWE-295: Improper Certificate Validation.
 *
 * With CURLOPT_SSL_VERIFYPEER off the handshake still encrypts and
 * authenticates nobody, so the machine in the middle needs no certificate at
 * all rather than a forged one. It is switched off to make a self-signed
 * development certificate work and it survives to production because nothing
 * fails when it does.
 */

function fetch($ch, $url)
{
    /* ruleid: curl-ssl-verifypeer-off */
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    /* ruleid: curl-ssl-verifypeer-off */
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    /* ruleid: curl-ssl-verifypeer-off */
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, null);

    /* ok: curl-ssl-verifypeer-off */
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
    /* ok: curl-ssl-verifypeer-off */
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
    /* ok: curl-ssl-verifypeer-off */
    curl_setopt($ch, CURLOPT_URL, $url);
}
