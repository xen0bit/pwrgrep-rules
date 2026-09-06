# CWE-1104: apt upgrade layer.
FROM ubuntu:20.04
# ruleid: dockerfile-apt-upgrade
RUN apt-get upgrade -y
# ruleid: dockerfile-apt-upgrade
RUN apt-get dist-upgrade -y
# ok: dockerfile-apt-upgrade
RUN apt-get update && apt-get install -y curl
# ok: dockerfile-apt-upgrade
RUN echo "hello"
# ruleid: dockerfile-apt-upgrade
RUN apt-get upgrade -y --allow-downgrades
# ruleid: dockerfile-apt-upgrade
RUN apt-get dist-upgrade -y --allow-unauthenticated
# ok: dockerfile-apt-upgrade
RUN apt-get install -y nginx=1.18.0
