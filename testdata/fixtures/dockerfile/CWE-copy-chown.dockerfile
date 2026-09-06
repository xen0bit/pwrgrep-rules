# CWE-732: COPY without --chown.
FROM alpine:3.18
# ruleid: dockerfile-copy-chown
COPY src/file.txt /app/file.txt
# ruleid: dockerfile-copy-chown
COPY myapp /opt/myapp
# ok: dockerfile-copy-chown
COPY --chown=nobody:nogroup src/file.txt /app/file.txt
# ok: dockerfile-copy-chown
COPY --chown=1000:1000 app /app
# ruleid: dockerfile-copy-chown
COPY config.yaml /etc/config.yaml
# ok: dockerfile-copy-chown
COPY --chown=appuser:appgroup --chmod=644 src2 /dest2
