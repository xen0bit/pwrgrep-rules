FROM ubuntu:20.04
# ruleid: set-pipefail
RUN cat file | grep foo
# ruleid: set-pipefail
RUN cat file2 | grep bar
# ok: set-pipefail
RUN echo neutral-one
# ok: set-pipefail
RUN echo neutral-two
