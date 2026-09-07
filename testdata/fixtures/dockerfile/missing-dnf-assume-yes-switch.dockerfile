# Unattended installs must not block on a confirmation prompt; pass the
# yes-switch explicitly. Fixed lines carry it, flagged lines do not.
FROM fedora:39
# ruleid: missing-dnf-assume-yes-switch
RUN dnf install httpd
# ruleid: missing-dnf-assume-yes-switch
RUN dnf install -q nginx
# ok: missing-dnf-assume-yes-switch
RUN dnf install -y httpd
# ok: missing-dnf-assume-yes-switch
RUN dnf install --assumeyes nginx
# ruleid: missing-dnf-assume-yes-switch
RUN dnf install vim-enhanced
# ok: missing-dnf-assume-yes-switch
RUN echo done
