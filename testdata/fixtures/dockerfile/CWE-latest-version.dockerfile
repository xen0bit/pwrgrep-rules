# CWE-1104: Floating tag — unpinned dependency.
# Using a floating tag follows a mutable reference; builds are not
# reproducible. The rule flags that floating tag; fix by pinning to a
# digest or explicit version like 20.04.
# ruleid: avoid-latest-version
FROM ubuntu:latest
# ruleid: avoid-latest-version
FROM alpine:latest
# ok: avoid-latest-version
FROM ubuntu:20.04
# ok: avoid-latest-version
FROM alpine:3.18
# ruleid: avoid-latest-version
FROM node:latest
# ruleid: avoid-latest-version
FROM python:latest
# ok: avoid-latest-version
FROM node:18.12.1
