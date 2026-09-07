# The rule keys on the stanza shape: it reports the package-manager lines
# of a stanza that does not end with a cleanup step.
# ok: missing-zypper-clean
FROM ubuntu:20.04
# ok: missing-zypper-clean
ENV REFRESHED_AT=2024-01-01
# ruleid: missing-zypper-clean
RUN zypper install vim && zypper clean
# ruleid: missing-zypper-clean
RUN zypper install nano
RUN zypper remove nano
