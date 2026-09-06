FROM ubuntu:20.04
# ok: missing-apk-no-cache
RUN apk add --no-cache curl
# ruleid: missing-apk-no-cache
RUN apk add curl
# ruleid: missing-apk-no-cache
RUN apk add wget
# ok: missing-apk-no-cache
RUN echo neutral-one
# ok: missing-apk-no-cache
RUN echo neutral-two
