# The rule reports one finding per apt-get-install stanza, at its first RUN.
FROM ubuntu:20.04
# ruleid: missing-assume-yes-switch
RUN apt-get install curl
RUN apt-get install wget
# ok: missing-assume-yes-switch
RUN echo neutral-one
# ok: missing-assume-yes-switch
RUN echo neutral-two
