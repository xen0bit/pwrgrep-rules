# Unattended installs must not block on a confirmation prompt; pass the
# yes-switch explicitly. Fixed lines carry it, flagged lines do not.
FROM centos:7
# ruleid: missing-yum-assume-yes-switch
RUN yum install httpd
# ruleid: missing-yum-assume-yes-switch
RUN yum install -q nginx
# ok: missing-yum-assume-yes-switch
RUN yum install -y httpd
# ok: missing-yum-assume-yes-switch
RUN yum install --assumeyes nginx
# ruleid: missing-yum-assume-yes-switch
RUN yum install vim-enhanced
# ok: missing-yum-assume-yes-switch
RUN echo done
