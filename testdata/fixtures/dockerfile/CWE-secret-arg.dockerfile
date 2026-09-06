# CWE-798: Secret via build argument — leaks in image history.
# Build args with secret-like names are baked into the image and visible
# in history. The rule flags those args; fix by using BuildKit secrets
# or multi-stage builds.
FROM alpine
# ruleid: secret-in-build-arg
ARG secret_token=abc123
# ruleid: secret-in-build-arg
ARG api_key=xyz
# ok: secret-in-build-arg
ARG version=1.0
# ok: secret-in-build-arg
ARG build_num=42
# ruleid: secret-in-build-arg
ARG password_value=secret123
# ruleid: secret-in-build-arg
ARG token_secret=abcXYZ
# ok: secret-in-build-arg
ARG app_version=2.0
