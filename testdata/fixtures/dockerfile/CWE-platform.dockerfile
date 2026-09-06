# CWE-710: Platform flag — non-portable build.
# That flag ties the image to one architecture, breaking multi-arch
# builds. The rule flags it when present with a base image; fix by
# removing it or handling outside the file.
# ruleid: avoid-platform-with-from
FROM --platform=linux/amd64 alpine
# ruleid: avoid-platform-with-from
FROM --platform=linux/arm64 ubuntu:20.04
# ok: avoid-platform-with-from
FROM alpine
# ok: avoid-platform-with-from
FROM ubuntu:20.04
# ruleid: avoid-platform-with-from
FROM --platform=linux/amd64 golang
# ruleid: avoid-platform-with-from
FROM --platform=linux/arm64 node
# ok: avoid-platform-with-from
FROM golang:1.21
