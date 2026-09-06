#!/bin/bash
# CWE-94: Code injection via eval/source
# ruleid: bash-code-injection
eval $1
# ruleid: bash-code-injection
eval "$USER_INPUT"
# ruleid: bash-code-injection
source $1
# ok: bash-code-injection
eval "echo hello"
# ok: bash-code-injection
source "/etc/profile"
