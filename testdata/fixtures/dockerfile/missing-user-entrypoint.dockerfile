# No user directive anywhere in the file, so each entrypoint is reported.
FROM ubuntu:20.04
# ruleid: missing-user-entrypoint
ENTRYPOINT ["python", "app.py"]
# ruleid: missing-user-entrypoint
ENTRYPOINT ["python", "other.py"]
# ok: missing-user-entrypoint
RUN echo neutral-one
# ok: missing-user-entrypoint
RUN echo neutral-two
