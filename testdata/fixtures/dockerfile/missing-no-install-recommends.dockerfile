# Recommended packages pull in extras the image never uses; opt out
# explicitly. Flagged lines install the defaults, fixed lines opt out.
FROM ubuntu:22.04
# ruleid: missing-no-install-recommends
RUN apt-get install -y nginx
# ruleid: missing-no-install-recommends
RUN apt-get update && apt-get install -y curl
# ok: missing-no-install-recommends
RUN apt-get install -y --no-install-recommends nginx
# ok: missing-no-install-recommends
RUN apt-get update && apt-get install -y --no-install-recommends curl
# ruleid: missing-no-install-recommends
RUN apt-get install -y git ca-certificates
# ok: missing-no-install-recommends
RUN echo done
