# CWE-1104: Mutable package set — upgrades every package.
# That operation upgrades everything at build time. The rule flags that
# invocation; fix by installing explicit package versions.
FROM centos
# ruleid: avoid-yum-update
RUN yum update -y
# ruleid: avoid-yum-update
RUN yum update
# ok: avoid-yum-update
RUN yum install -y httpd
# ok: avoid-yum-update
RUN echo "hello"
# ruleid: avoid-yum-update
RUN yum update -y --security
# ruleid: avoid-yum-update
RUN yum update --assumeyes
# ok: avoid-yum-update
RUN yum install -y httpd-2.4.6-95
