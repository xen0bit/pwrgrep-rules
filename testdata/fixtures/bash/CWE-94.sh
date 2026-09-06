#!/bin/bash
# CWE-94: Code Injection via useless cat
# Useless cat in pipeline can be replaced and may hide injection

# ruleid: useless-cat
cat file.txt | grep pattern
# ruleid: useless-cat
cat file.txt | cat
# ruleid: useless-cat
cat /etc/passwd | grep root
# ruleid: useless-cat
cat data.log | wc -l

# ok: useless-cat
cat file.txt
# ok: useless-cat
grep pattern file.txt
# ok: useless-cat
grep root /etc/passwd
