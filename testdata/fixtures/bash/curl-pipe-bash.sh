#!/bin/bash
# CWE-829: piping curl output straight into a shell runs untrusted code.
# Flag curl piped into bash; safe lines fetch without executing.

# ruleid: curl-pipe-bash
curl http://example.com/install.sh | sudo bash -s
# ruleid: curl-pipe-bash
curl -sSL http://example.com/setup.sh | sudo bash -s -- --yes
# ruleid: curl-pipe-bash
curl http://example.com/run.sh | xargs bash -c
# ruleid: curl-pipe-bash
sudo bash -c "$(curl http://example.com/env.sh)"
# ruleid: curl-pipe-bash
sudo bash <(curl http://example.com/extra.sh)

# ok: curl-pipe-bash
curl http://example.com/install.sh | bash
# ok: curl-pipe-bash
curl -o install.sh http://example.com/install.sh
# ok: curl-pipe-bash
echo hello | grep hi
# ok: curl-pipe-bash
bash script.sh
