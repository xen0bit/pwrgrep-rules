# CWE-1104: Mutable layer — pulls latest at build time.
# That command pulls latest packages. The rule flags that step; fix by
# installing pinned packages.
FROM opensuse
# ruleid: avoid-zypper-update
RUN zypper update -y
# ruleid: avoid-zypper-update
RUN zypper update
# ok: avoid-zypper-update
RUN zypper install -y curl
# ok: avoid-zypper-update
RUN echo "hello"
# ruleid: avoid-zypper-update
RUN zypper update -y --auto-agree-with-licenses
# ruleid: avoid-zypper-update
RUN zypper update --no-confirm
# ok: avoid-zypper-update
RUN zypper install -y curl-7.60.0
