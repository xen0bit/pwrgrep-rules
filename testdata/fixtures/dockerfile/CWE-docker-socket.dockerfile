# CWE-732: Socket exposed via volume — build escape.
# Declaring that socket as a volume exposes the host daemon to the build.
# The rule flags that declaration; fix by not declaring it.
FROM alpine
# ruleid: dockerfile-dockerd-socket-mount
VOLUME /var/run/docker.sock
# ruleid: dockerfile-dockerd-socket-mount
VOLUME /var/run/docker.sock
# ok: dockerfile-dockerd-socket-mount
VOLUME /data
# ok: dockerfile-dockerd-socket-mount
VOLUME /cache
# ruleid: dockerfile-dockerd-socket-mount
VOLUME /var/run/docker.sock:ro
# ruleid: dockerfile-dockerd-socket-mount
VOLUME ["/var/run/docker.sock"]
# ok: dockerfile-dockerd-socket-mount
VOLUME /var/lib/data
