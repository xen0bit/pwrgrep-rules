# The index files fetched for the install linger in the layer unless they
# are removed in the same step. Flagged lines keep them, fixed lines drop them.
FROM ubuntu:22.04
# ruleid: remove-package-lists
RUN apt-get update
# ruleid: remove-package-lists
RUN apt-get update && apt-get install -y nginx
# ok: remove-package-lists
RUN apt-get update && rm -rf /var/lib/apt/lists/*
# ok: remove-package-lists
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
# ruleid: remove-package-lists
RUN apt-get update -o Acquire::Retries=3
# ok: remove-package-lists
RUN echo done
