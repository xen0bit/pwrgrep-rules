FROM ubuntu:20.04
# ruleid: prefer-copy-over-add
ADD app.tar.gz /tmp/app.tar.gz
# ruleid: prefer-copy-over-add
ADD https://example.com/lib.tar.gz /tmp/lib.tar.gz
# ok: prefer-copy-over-add
COPY app.tar.gz /tmp/app-copy.tar.gz
# ok: prefer-copy-over-add
ADD notes.txt /tmp/notes.txt
