# The interactive frontend is unstable under automation; scripted images
# should call the stable tool. Flagged lines use it, fixed lines do not.
FROM ubuntu:22.04
# ruleid: prefer-apt-get
RUN apt update
# ruleid: prefer-apt-get
RUN apt install -y curl
# ok: prefer-apt-get
RUN apt-get update
# ok: prefer-apt-get
RUN apt-get install -y curl
# ruleid: prefer-apt-get
RUN apt upgrade -y
# ok: prefer-apt-get
RUN echo done
