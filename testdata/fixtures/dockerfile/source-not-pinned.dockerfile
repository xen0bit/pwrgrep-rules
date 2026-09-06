# Unpinned base images are flagged; sha256-pinned ones are the fix.
# ruleid: dockerfile-source-not-pinned
FROM ubuntu:20.04
# ruleid: dockerfile-source-not-pinned
FROM golang:1.21@md5:deadbeef
# ok: dockerfile-source-not-pinned
FROM node:18.12.1@sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
# ok: dockerfile-source-not-pinned
FROM python:3.11@sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
# ok: dockerfile-source-not-pinned
RUN echo hello
