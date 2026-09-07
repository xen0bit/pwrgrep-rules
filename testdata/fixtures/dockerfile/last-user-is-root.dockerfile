# Only the last USER in the file is reported, so one ruleid is the most a
# single fixture can carry for this rule.
FROM ubuntu:20.04
# ok: last-user-is-root
USER appuser
# ok: last-user-is-root
USER 1001
# ok: last-user-is-root
RUN echo hello
# ruleid: last-user-is-root
USER root
