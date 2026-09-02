# pwrgrep-rules

The structural rule corpus for [pwrq](https://github.com/xen0bit/pwrq): 1837
rules in 26 languages, each one a pwrq query and nothing else.

A rule is a file and a header. There is no schema, no plugin API and nothing to
rebuild — writing one is copying a file:

```
# rules: go-weak-hash
# languages: go
# fixture: go/weak-hash.go
# from: go/lang/security/audit/crypto/use_of_weak_crypto.yaml (use-of-md5, use-of-sha1)

["md5.New()", "md5.Sum($$$A)", "sha1.New()", "sha1.Sum($$$A)"] as $calls
| ["\"crypto/md5\"", "\"crypto/sha1\""] as $imports
| scan_ast("*.go"; $calls + $imports) as $all
| ($all | of($calls) | in_files_with($all | of($imports)))
| finding("go-weak-hash";
    "this uses a hash that is not collision resistant; SHA-256 or SHA-3 instead")
| report
```

The header is the whole of a rule's metadata, and it is comments inside the
query rather than a file alongside it, so that moving a rule moves everything
about it. `# rules:` names the ids it reports under and is the one line a rule
cannot omit. `# languages:` names the grammars its patterns are code in; a rule
that searches text names none. `# fixture:` names an annotated file under
`testdata/fixtures` that proves it fires. `# from:` is provenance.

## Layout

```
rules/<language>/<framework>/<category>/<rule>.pwrq
testdata/fixtures/<language>/<rule>.<ext>
gen/                 the translator this corpus came from, frozen
tools/validate.py    the check CI runs
```

Rules are grouped by what they search rather than by who wrote them. The path
is also how a rule is selected, so naming a directory narrows a run:
`invoke_pwrgrep("."; "go/lang/security")` over a Go repository, not all 1837.

## Using it

pwrq embeds this repository as a Go module, so the corpus ships inside the
binary and there is nothing to install:

```go
import pwrgreprules "github.com/xen0bit/pwrgrep-rules"

// pwrgreprules.FS is the corpus, rooted at "rules".
```

It is a module rather than a git submodule for one concrete reason: a
submodule's contents are not in the zip the module proxy serves, so
`go install pwrq@latest` would fetch a tree with an empty rules directory and
fail at the embed. As a dependency it is fetched like anything else, pinned in
`go.sum`, and every build path gets the same corpus.

To run a checkout of this repository instead of the copy inside your binary,
put it on `PWRQ_RULES`:

```
PWRQ_RULES=$PWD/rules pwrq -n '[invoke_pwrgrep("."; "go/lang/security")]'
```

pwrq reads `$PWRQ_RULES`, then `~/.config/pwrq/rules`, then
`/usr/share/pwrq/rules`, then its own copy, and a rule found earlier hides one
with the same path found later — which is how a shipped rule is edited.

## Validating

```
make -C ../pwrq build
PWRQ=../pwrq/pwrq tools/validate.py
```

It checks that every file under `rules/` loads, that every rule says where it
came from, that every language named is a grammar the binary carries, that
every rule with a fixture fires on exactly the lines the fixture marks and no
others, that no fixture is orphaned, and that the whole corpus runs over a tree
without a rule erroring.

That last one is the check a compile cannot make. A query that parses can still
fail on the first match it is given — a regex RE2 will not take, a comparison
the operator cannot read — and that is worse than a rule that was never
shipped, because it takes the whole run down with it.

`--no-smoke` skips it, which is most of the ninety seconds.

Fixtures are annotated the way the corpus this was translated from annotates
them: `ruleid: <id>` on the line before a line that must produce a finding,
`ok: <id>` before one that must not. The check is set equality, so a rule that
fires somewhere nobody marked fails just as loudly as one that misses a line. A
fixture needs at least one of each — a fixture with no `ok:` cannot show a rule
is not simply firing everywhere.

## Where the corpus came from

`gen/` holds the translator that produced most of it from
[opengrep-rules](https://github.com/opengrep/opengrep-rules): `port.jq` reads a
YAML rule file and writes the `.pwrq` query, `MANIFEST.json` accounts for every
rule it was given — translated, or listed with the reason it was not — and
`VALIDATION.json` records how each translated rule scored against the fixture
its original was tested with.

It is kept as provenance and is no longer run. A rule is edited in place now,
and `MANIFEST.json` and `VALIDATION.json` describe the translation as it stood,
not the corpus as it is.

Eighteen rules were written by hand rather than translated — one per language
family, each with a fixture of its own and prose saying where it departs from
the rule it came from. They came first and are what the translator was written
against. They are no longer kept apart: a rule is a rule, and they sit in the
category they search, named for the id they report under.
