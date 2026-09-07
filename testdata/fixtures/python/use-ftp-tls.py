# ftplib.FTP sends credentials in cleartext. Flag it; FTP_TLS is
# the fix.
import ftplib


def flag_plain(host):
    # ruleid: use-ftp-tls
    ftp = ftplib.FTP(host)
    # ruleid: use-ftp-tls
    ftp = ftplib.FTP(host, user="u", passwd="p")
    # ruleid: use-ftp-tls
    ftp = ftplib.FTP(timeout=5)


def safe_tls(host):
    # ok: use-ftp-tls
    ftp = ftplib.FTP_TLS(host)
    # ok: use-ftp-tls
    ftp = ftplib.FTP_TLS(host, user="u", passwd="p")
    # ok: use-ftp-tls
    ftp = ftplib.FTP_TLS(timeout=5)
