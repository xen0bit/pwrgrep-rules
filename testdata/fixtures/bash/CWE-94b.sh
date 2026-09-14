#!/bin/bash
# CWE-94: Code injection via eval
# ruleid: bash-code-injection
eval $1
# ruleid: bash-code-injection
eval "$USER_INPUT"
# The program's own file is not attacker input.
# ok: bash-code-injection
source $1
# ok: bash-code-injection
eval "echo hello"
# ok: bash-code-injection
source "/etc/profile"
