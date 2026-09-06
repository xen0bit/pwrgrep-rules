FROM ubuntu:20.04
# ruleid: use-shell-instruction
RUN ln -sf /bin/bash /bin/sh
# ruleid: use-shell-instruction
RUN ln -s /bin/dash /bin/sh
# ok: use-shell-instruction
SHELL ["/bin/bash", "-c"]
# ok: use-shell-instruction
RUN echo neutral
