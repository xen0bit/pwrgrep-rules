#!/bin/bash
# CWE-22: Path Traversal / Iteration over ls output is fragile
# Using ls output in for loop is fragile and should use glob instead

# ruleid: iteration-over-ls-output
for i in $(ls *.txt); do
  echo "$i"
done

# ruleid: iteration-over-ls-output
for file in $(ls); do
  cat "$file"
done

# ruleid: iteration-over-ls-output
for f in $(ls -la *.log); do
  echo "$f"
done

# ruleid: iteration-over-ls-output
for x in $(ls -1); do
  echo "$x"
done

# ok: iteration-over-ls-output
for file in *.txt; do
  echo "$file"
done

# ok: iteration-over-ls-output
for i in $(find . -name "*.txt"); do
  echo "$i"
done

# ok: iteration-over-ls-output
for f in /var/log/*.log; do echo "$f"; done
