#!/bin/bash
# CWE-78: OS Command Injection via IFS tampering and unquoted expansions
# IFS affects word splitting for unquoted variables

# ruleid: ifs-tampering
IFS=:
# ruleid: ifs-tampering
IFS=$'\n'
# ruleid: ifs-tampering
IFS=" "
# ruleid: ifs-tampering
IFS=$' \t\n'

# ok: ifs-tampering
echo "safe IFS not tampered"
# ok: ifs-tampering
var="fixed"
# ok: ifs-tampering
echo "default IFS is space tab newline"
