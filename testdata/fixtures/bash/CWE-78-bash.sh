#!/bin/bash
# CWE-78: OS Command Injection via eval with user input.
# eval executes its argument as shell code; if the argument contains a
# variable like $1 or ${user_input}, an attacker can inject '; rm -rf /'.
# Safe eval uses a literal string without variable expansion.

# ruleid: bash-os-command
eval $1

# ruleid: bash-os-command
eval "$USER_INPUT"

# ruleid: bash-os-command
eval $USER_DATA

# ok: bash-os-command
eval "echo hello"

# ok: bash-os-command
eval 'ls -l'
