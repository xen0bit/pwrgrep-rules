# CWE-250: container runs as privileged.
FROM ubuntu:20.04
# ruleid: dockerfile-user-root
USER root
# ruleid: dockerfile-user-root
USER root
# ok: dockerfile-user-root
USER appuser
# ok: dockerfile-user-root
USER nobody
# ruleid: dockerfile-user-root
USER root:root
# ruleid: dockerfile-user-root
USER  root
# ok: dockerfile-user-root
USER 1001
