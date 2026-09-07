#!/bin/bash
# Unquoted variable expansions are split on whitespace (word splitting).
# Quote them ("$VAR"); only the first finding id is annotated here.

# ruleid: unquoted-variable-expansion-in-command
test $VAR = "x"
# ruleid: unquoted-variable-expansion-in-command
cmd $VAR extra
# ruleid: unquoted-variable-expansion-in-command
cp $SRC $DST
# ruleid: unquoted-variable-expansion-in-command
echo $A $B

# ok: unquoted-variable-expansion-in-command
cmd "$VAR"
# ok: unquoted-variable-expansion-in-command
cmd "${VAR}"
# ok: unquoted-variable-expansion-in-command
echo "hello"
