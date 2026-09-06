# CWE-1104: Mutable layer — manager updates all packages.
# That operation upgrades everything to latest at build time. The rule
# flags the invocation; fix by installing with explicit versions.
FROM fedora
# ruleid: avoid-dnf-update
RUN dnf update -y
# ruleid: avoid-dnf-update
RUN dnf update
# ok: avoid-dnf-update
RUN dnf install -y httpd
# ok: avoid-dnf-update
RUN echo "hello"
# ruleid: avoid-dnf-update
RUN dnf update -y --security
# ruleid: avoid-dnf-update
RUN dnf update --refresh
# ok: avoid-dnf-update
RUN dnf install -y httpd-2.4.57
