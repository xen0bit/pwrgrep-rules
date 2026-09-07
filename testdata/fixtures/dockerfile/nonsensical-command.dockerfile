FROM ubuntu:20.04
# ruleid: nonsensical-command
RUN shutdown -h now
# ruleid: nonsensical-command
RUN service nginx start
# ok: nonsensical-command
RUN echo hello
# ok: nonsensical-command
RUN apt-get install -y curl
