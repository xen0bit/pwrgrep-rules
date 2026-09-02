#!/usr/bin/env python3
"""Check the corpus the way a rule actually fails.

A structural rule fails in a way reading it cannot catch. The patterns
compile, the query runs, the pipeline produces an array - and the array is
empty, or holds the wrong lines, because the pattern describes a construct the
grammar spells differently. Nothing errors. So the rules that carry a fixture
are run against it line by line: where the rule is supposed to fire, and where
it is not.

Everything here is asked of a real pwrq binary, because a rule is a pwrq query
and there is no second implementation of what one means.

    tools/validate.py                 # against pwrq on PATH
    PWRQ=/tmp/pwrq tools/validate.py  # against a build of your own
    tools/validate.py --no-smoke      # skip the slow whole-corpus run
"""

import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RULES = os.path.join(ROOT, "rules")
FIXTURES = os.path.join(ROOT, "testdata", "fixtures")
PWRQ = os.environ.get("PWRQ", "pwrq")

# The convention the corpus is annotated with: a comment reading
# `ruleid: <id>` says the next line must produce a finding, and `ok: <id>` says
# it must not. It is the upstream convention, kept so a fixture can still be
# read against the rule it was written for.
ANNOTATION = re.compile(r"\b(ruleid|ok):\s*([A-Za-z0-9_-]+)")


class Failures:
    """Every check runs; the exit code is decided at the end.

    Reporting the first failure and stopping would hide the shape of a break
    that touches many rules at once, which is the kind this corpus has.
    """

    def __init__(self):
        self.count = 0

    def __call__(self, message):
        print("FAIL " + message)
        self.count += 1

    def check(self, name, ok, detail=""):
        print(("ok   " if ok else "FAIL ") + name + (("  " + detail) if detail else ""))
        if not ok:
            self.count += 1


def run(query, **args):
    """Run one query. Returns what it produced, or None and why it failed."""
    argv = [PWRQ, "-n", "-c", query]
    for name, value in args.items():
        argv += ["--argjson", name, json.dumps(value)]
    env = dict(os.environ, PWRQ_RULES=RULES)
    done = subprocess.run(argv, capture_output=True, text=True, env=env)
    if done.returncode != 0:
        return None, done.stderr.strip()
    return [json.loads(l) for l in done.stdout.splitlines() if l.strip()], ""


def pwrq(query, **args):
    """Run one query that has no business failing, and read back its output."""
    out, why = run(query, **args)
    if out is None:
        sys.exit("pwrq failed: %s\n%s" % (query[:60], why))
    return out


def corpus():
    """The rules this repository defines, and only those.

    A pwrq binary carries a corpus of its own, and PWRQ_RULES overlays rather
    than replaces it - so a rule is ours only if it was read from this
    checkout. Without the filter a stale binary's copy of a rule we just moved
    would be validated instead of the file in the tree.
    """
    rules = pwrq(
        "[get_pwrgrep_rule(null) | select(.Origin == $dir) "
        "| {Path, Ids, Languages, From, Fixture}]",
        dir=RULES,
    )[0]
    return sorted(rules, key=lambda r: r["Path"])


def expectations(path, rule_id, fail):
    """The lines a rule must report in this fixture, and the lines it must not.

    An annotation describes the next line of code, so a run of annotations is
    skipped to reach the statement they mark.
    """
    lines = open(path, encoding="utf-8", errors="replace").read().split("\n")
    want, permitted = [], []
    for i, line in enumerate(lines):
        m = ANNOTATION.search(line)
        if not m:
            continue
        if m.group(2) != rule_id:
            fail("%s:%d marks %r, but the rule beside it is %r"
                 % (os.path.relpath(path, ROOT), i + 1, m.group(2), rule_id))
            continue
        subject = i + 1
        while subject < len(lines) and ANNOTATION.search(lines[subject]):
            subject += 1
        if subject >= len(lines):
            fail("%s:%d annotates nothing; it is the last line"
                 % (os.path.relpath(path, ROOT), i + 1))
            continue
        (want if m.group(1) == "ruleid" else permitted).append(subject + 1)
    return sorted(want), sorted(permitted)


def main():
    fail = Failures()
    rules = corpus()

    on_disk = sum(1 for _, _, names in os.walk(RULES)
                  for n in names if n.endswith(".pwrq"))
    fail.check("every rule file in rules/ loads",
               on_disk == len(rules) and on_disk > 0,
               "%d files, %d loaded" % (on_disk, len(rules)))

    # Provenance stays attached to the rule rather than to a README that will
    # drift away from it.
    missing_from = [r["Path"] for r in rules if not r.get("From")]
    fail.check("every rule says where it came from", not missing_from,
               "" if not missing_from else "%d without `# from:` (e.g. %s)"
               % (len(missing_from), missing_from[0]))

    # A rule written for a grammar the binary does not carry is a rule that
    # ships, runs, reports nothing, and says nothing about why.
    built = set(pwrq("[get_ast_language(null) | .Name]")[0])
    unknown = {}
    for rule in rules:
        for language in rule.get("Languages") or []:
            if language not in built:
                unknown.setdefault(language, []).append(rule["Path"])
    fail.check("every language named is a grammar this build carries", not unknown,
               "" if not unknown else "; ".join(
                   "%s (%d rules, e.g. %s)" % (lang, len(paths), paths[0])
                   for lang, paths in sorted(unknown.items())))

    # The fixtures, which is the only check that runs a rule and looks at where
    # it landed.
    with_fixture = [r for r in rules if r.get("Fixture")]
    fail.check("some rule names a fixture", bool(with_fixture),
               "%d rules" % len(with_fixture))

    pairs = []
    for rule in with_fixture:
        path = os.path.join(FIXTURES, rule["Fixture"])
        if not os.path.exists(path):
            fail("%s names fixture %s, which is not in testdata/fixtures"
                 % (rule["Path"], rule["Fixture"]))
            continue
        pairs.append({"rule": rule["Path"], "id": rule["Ids"][0], "path": path})

    # One process for all of them: loading the corpus costs more than running
    # eighteen rules over eighteen small files.
    found = pwrq(
        "[$pairs[] | . as $p | {rule: $p.rule, findings: "
        "[invoke_pwrgrep($p.path; $p.rule) | {id: .RuleId, line: .LineNumber, "
        "message: .Message}]}]",
        pairs=pairs,
    )[0] if pairs else []
    by_rule = {f["rule"]: f["findings"] for f in found}

    exact = 0
    for pair in pairs:
        want, permitted = expectations(pair["path"], pair["id"], fail)
        findings = by_rule.get(pair["rule"], [])
        for f in findings:
            if f["id"] != pair["id"]:
                fail("%s reported RuleId %r; a rule is named by its header"
                     % (pair["rule"], f["id"]))
            if not f["message"]:
                fail("%s:%s reported no message, so a reader is told what was "
                     "found but not why it matters" % (pair["rule"], f["line"]))
        got = sorted(f["line"] for f in findings)
        rel = os.path.relpath(pair["path"], ROOT)
        if not want:
            fail("%s marks no line with `ruleid: %s`, so it cannot show the rule fires"
                 % (rel, pair["id"]))
            continue
        if not permitted:
            fail("%s marks no line with `ok: %s`, so it cannot show the rule is not "
                 "simply firing everywhere" % (rel, pair["id"]))
            continue
        if got != want:
            fail("%s\n       fired on lines %s\n       fixture marks  %s\n"
                 "       (lines marked ok: %s)" % (pair["rule"], got, want, permitted))
            continue
        exact += 1
    fail.check("every rule with a fixture fires exactly where it is marked",
               exact == len(pairs), "%d of %d" % (exact, len(pairs)))

    # A fixture left behind when a rule is renamed looks like coverage and is
    # not.
    claimed = {os.path.normpath(r["Fixture"]) for r in with_fixture}
    orphans = []
    for dirpath, _, names in os.walk(FIXTURES):
        for name in names:
            rel = os.path.normpath(os.path.relpath(os.path.join(dirpath, name), FIXTURES))
            if rel not in claimed:
                orphans.append(rel)
    fail.check("every fixture belongs to a rule", not orphans,
               "" if not orphans else "orphaned: " + ", ".join(sorted(orphans)))

    # A query that compiles can still fail on the first match it is given: a
    # regex RE2 will not take, a comparison the operator cannot read. That is
    # worse than a rule that was never shipped, because it takes the whole run
    # down with it, and it is invisible until someone points pwrq at a file
    # that reaches the step. So every rule is run once against a tree small
    # enough to be cheap and varied enough to reach them.
    if "--no-smoke" not in sys.argv:
        out, why = run("[invoke_pwrgrep($dir; \"\")] | length", dir=FIXTURES)
        fail.check("the whole corpus runs without erroring", out is not None,
                   "%d rules over testdata/fixtures, %d findings"
                   % (len(rules), out[0]) if out is not None else why.split("\n")[0])

    print()
    if fail.count:
        sys.exit("%d check(s) failed" % fail.count)
    print("%d rules, %d with a fixture: all good" % (len(rules), len(pairs)))


if __name__ == "__main__":
    main()
