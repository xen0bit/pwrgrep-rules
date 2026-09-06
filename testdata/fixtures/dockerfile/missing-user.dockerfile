# No user directive anywhere in the file, so each command is reported.
FROM ubuntu:20.04
# ruleid: missing-user
CMD ["python", "app.py"]
# ruleid: missing-user
CMD ["python", "other.py"]
# ok: missing-user
RUN echo neutral-one
# ok: missing-user
RUN echo neutral-two
