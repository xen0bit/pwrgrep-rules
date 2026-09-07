#!/bin/bash
# CWE-829/CWE-94: eval'ing a fetched script runs whatever the server returns.
# Flag eval over curl output; plain eval of locals and plain fetches are safe.

# ruleid: curl-eval
eval "$(curl http://example.com/install.sh)"
# ruleid: curl-eval
eval `curl http://example.com/setup.sh`
# ruleid: curl-eval
eval "$(curl -sSL http://example.com/run.sh)"

# ok: curl-eval
eval "echo hello"
# ok: curl-eval
curl -o install.sh http://example.com/install.sh
# ok: curl-eval
echo "$(curl http://example.com/version.txt)"
