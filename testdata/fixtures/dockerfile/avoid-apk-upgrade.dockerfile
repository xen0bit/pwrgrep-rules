# Base images should already be current; refreshing every package at build
# time makes layers non-deterministic. Pin versions instead.
FROM alpine:3.18
# ruleid: avoid-apk-upgrade
RUN apk upgrade
# ruleid: avoid-apk-upgrade
RUN apk update && apk upgrade --no-cache
# ok: avoid-apk-upgrade
RUN apk update
# ok: avoid-apk-upgrade
RUN apk add --no-cache curl=8.4.0-r0
# ruleid: avoid-apk-upgrade
RUN apk upgrade -a
# ok: avoid-apk-upgrade
RUN echo done
