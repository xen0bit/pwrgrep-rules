# Builds already run as root; escalating again only widens what a
# compromised step can do. Flagged lines escalate, fixed lines do not.
FROM ubuntu:22.04
# ruleid: no-sudo-in-dockerfile
RUN sudo apt-get update
# ruleid: no-sudo-in-dockerfile
RUN sudo -u www-data ./migrate.sh
# ok: no-sudo-in-dockerfile
RUN apt-get update
# ok: no-sudo-in-dockerfile
USER www-data
# ruleid: no-sudo-in-dockerfile
RUN sudo make install
# ok: no-sudo-in-dockerfile
RUN echo done
