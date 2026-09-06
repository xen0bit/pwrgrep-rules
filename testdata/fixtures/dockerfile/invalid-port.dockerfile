FROM ubuntu:20.04
# ok: invalid-port
EXPOSE 80
# ruleid: invalid-port
EXPOSE 99999
# ok: invalid-port
EXPOSE 443
# ruleid: invalid-port
EXPOSE 65536
