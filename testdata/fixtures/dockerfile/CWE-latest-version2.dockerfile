# CWE-1104: floating tag.
# ruleid: dockerfile-latest-version
FROM ubuntu:latest
# ruleid: dockerfile-latest-version
FROM node:latest
# ok: dockerfile-latest-version
FROM ubuntu:20.04
# ok: dockerfile-latest-version
FROM node:18-alpine
# ruleid: dockerfile-latest-version
FROM python:latest
# ruleid: dockerfile-latest-version
FROM redis:latest
# ok: dockerfile-latest-version
FROM python:3.11-slim
