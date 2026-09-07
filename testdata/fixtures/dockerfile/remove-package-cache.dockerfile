# Refreshing the index without clearing the cache leaves megabytes in the
# layer. Flagged lines stop after the refresh, fixed lines clear after it.
FROM ubuntu:22.04
# ruleid: remove-package-cache
RUN apt-get update
# ruleid: remove-package-cache
RUN apt-get update && apt-get install -y nginx
# ok: remove-package-cache
RUN apt-get update && apt-get clean
# ok: remove-package-cache
RUN apt-get update && apt-get install -y nginx && apt-get clean
# ruleid: remove-package-cache
RUN apt-get update -o Acquire::Retries=3
# ok: remove-package-cache
RUN echo done
