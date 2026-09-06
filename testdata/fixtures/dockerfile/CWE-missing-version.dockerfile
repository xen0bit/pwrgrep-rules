# CWE-1104: Unpinned base image — defaults to latest.
# A base reference without a tag defaults to latest, hiding the version.
# The rule flags bare references; fix by pinning to a tag or digest.
# ruleid: missing-image-version
FROM alpine
# ruleid: missing-image-version
FROM ubuntu
# ok: missing-image-version
FROM alpine:3.18
# ok: missing-image-version
FROM ubuntu:20.04
# ruleid: missing-image-version
FROM busybox
# ruleid: missing-image-version
FROM postgres
# ok: missing-image-version
FROM busybox:1.36
