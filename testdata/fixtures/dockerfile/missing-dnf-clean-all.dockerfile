# Package manager caches bloat the layer; finish the RUN line by clearing
# them. Flagged lines stop at install/update, fixed lines clean up.
FROM fedora:39
# ruleid: missing-dnf-clean-all
RUN dnf install httpd
# ruleid: missing-dnf-clean-all
RUN dnf update -y
# ok: missing-dnf-clean-all
RUN dnf install -y httpd && dnf clean all
# ok: missing-dnf-clean-all
RUN dnf update -y && dnf clean all
# ruleid: missing-dnf-clean-all
RUN dnf groupinstall "Web Server"
# ok: missing-dnf-clean-all
RUN echo done
