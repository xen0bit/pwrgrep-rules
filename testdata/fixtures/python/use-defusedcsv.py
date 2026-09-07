# The csv module parses billion-laughs-style payloads without limits.
# Flag csv.writer; defusedcsv.writer is the fix.
import csv
import defusedcsv


def flag_csv(path):
    # ruleid: use-defusedcsv
    out = csv.writer(open(path, "w"))
    # ruleid: use-defusedcsv
    out = csv.writer(fh, quoting=csv.QUOTE_ALL)
    # ruleid: use-defusedcsv
    out = csv.writer(fh, dialect="excel")


def safe_defused(path):
    # ok: use-defusedcsv
    out = defusedcsv.writer(open(path, "w"))
    # ok: use-defusedcsv
    out = defusedcsv.writer(fh, quoting=csv.QUOTE_ALL)
    # ok: use-defusedcsv
    out = defusedcsv.writer(fh, dialect="excel")
