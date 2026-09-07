# Only the last entrypoint takes effect, so repeats silently discard the
# earlier ones. A lone entrypoint is fine; back-to-back pairs are flagged.
FROM ubuntu:22.04
# ok: multiple-entrypoint-instructions
ENTRYPOINT ["only"]
# ok: multiple-entrypoint-instructions
CMD ["run"]
# ruleid: multiple-entrypoint-instructions
ENTRYPOINT ["first"]
ENTRYPOINT ["second"]
# ruleid: multiple-entrypoint-instructions
ENTRYPOINT ["third"]
ENTRYPOINT ["fourth"]
