# Changing directory inside RUN only lasts for that layer; declare the work
# location once instead. Flagged lines step elsewhere mid-build.
FROM ubuntu:22.04
WORKDIR /app
# ruleid: use-workdir
RUN cd /app && make
# ruleid: use-workdir
RUN cd /tmp && ./setup.sh
# ok: use-workdir
RUN make
# ok: use-workdir
RUN echo built
# ruleid: use-workdir
RUN cd /srv && npm ci
# ok: use-workdir
CMD ["./app"]
