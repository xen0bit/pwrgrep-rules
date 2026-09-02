<?php
/* CWE-319: Cleartext Transmission of Sensitive Information.
 *
 * FTP sends the username, the password and the file over the wire with no
 * encryption, so anyone on the path reads all three. ftp_ssl_connect is the
 * same protocol over TLS; SFTP over SSH is the usual answer.
 */

function upload($host, $user, $password, $local)
{
    /* ruleid: ftp-use */
    $conn = ftp_connect($host);
    /* ruleid: ftp-use */
    ftp_login($conn, $user, $password);
    /* ruleid: ftp-use */
    ftp_put($conn, '/incoming/data.csv', $local, FTP_BINARY);
    /* ruleid: ftp-use */
    ftp_close($conn);

    /* ok: ftp-use */
    $ssh = ssh2_connect($host, 22);
    /* ok: ftp-use */
    $sftp = ssh2_sftp($ssh);

    return [$conn, $ssh, $sftp];
}
