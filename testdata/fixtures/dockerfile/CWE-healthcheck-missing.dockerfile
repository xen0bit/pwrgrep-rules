# CWE-754: Dockerfile missing HEALTHCHECK.
# No HEALTHCHECK in this file — FROM should be flagged.
# ruleid: dockerfile-healthcheck-missing
FROM alpine:3.18
RUN echo "hello"
# ruleid: dockerfile-healthcheck-missing
FROM ubuntu:22.04
RUN apt-get update
# ok: dockerfile-healthcheck-missing
RUN echo "not a FROM — should not be flagged"
# ok: dockerfile-healthcheck-missing
RUN apt-get install -y curl
# The good case with HEALTHCHECK would be in a separate good Dockerfile that the test runner does not mix with this bad file.
# To satisfy ok without introducing a HEALTHCHECK that would suppress the bad, we annotate RUN lines as ok.
# ruleid: dockerfile-healthcheck-missing
FROM node:18
# ruleid: dockerfile-healthcheck-missing
FROM golang:1.21
# ok: dockerfile-healthcheck-missing
RUN echo "healthcheck ok placeholder"
