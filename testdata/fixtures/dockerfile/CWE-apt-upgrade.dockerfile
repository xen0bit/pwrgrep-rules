# CWE-1104: Non-deterministic layer — upgrades all packages at build.
# Pulling latest on every build breaks reproducibility. The rule flags
# that upgrade pattern; fix by installing specific versions or removing
# the upgrade step.
FROM ubuntu:20.04
# ruleid: avoid-apt-get-upgrade
RUN apt-get upgrade -y
# ruleid: avoid-apt-get-upgrade
RUN apt-get dist-upgrade -y
# ok: avoid-apt-get-upgrade
RUN apt-get update
# ok: avoid-apt-get-upgrade
RUN echo "hello"
# ruleid: avoid-apt-get-upgrade
RUN apt-get upgrade
# ruleid: avoid-apt-get-upgrade
RUN apt-get dist-upgrade -y
# ok: avoid-apt-get-upgrade
RUN apt-get install -y nginx=1.18.0
