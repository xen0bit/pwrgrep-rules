# Adding a rule

This is what the last pass over the C corpus turned out to need — the loop, the
handful of operators that do most of the work, the shapes the matcher will and
will not take, and the judgement calls that decide whether a rule is worth
shipping. It is written for the next person who is told "add rules" and would
otherwise spend a day rediscovering the same six things.

The README says what a rule *is*. This says how to write one that works.

## The loop

A rule is a file. There is nothing to build, nothing to register, and no
restart: `PWRQ_RULES` points pwrq at a checkout, and the rule is live the next
time it runs.

```
make -C ../pwrq build
export PWRQ=../pwrq/pwrq
export PWRQ_RULES=$PWD/rules
```

Then, over and over:

```
$PWRQ -n -c '[invoke_pwrgrep("testdata/fixtures/c/CWE-134.c";
                             "c/lang/security/uncontrolled-format-string")
              | {l: .LineNumber, m: .Message}]'
```

That is the whole inner loop, and it is about half a second. Run
`tools/validate.py --no-smoke` when the rule is close — eleven seconds, and it
is the check that actually decides whether the fixture and the rule agree. The
full run with the smoke test is ninety seconds and belongs at the end.

Two things about that inner loop are worth knowing early. `invoke_pwrgrep`
takes a catalogue path as well as a finding id, so you can name the file you
are editing rather than the id it reports. And naming a rule that does not
exist is an error rather than an empty result, deliberately: "no rule called
that" and "your code is clean" must not look alike.

## Start with the fixture

Write the code before the query. Not because it is tidier, but because the
fixture is the only thing that will tell you the rule is wrong, and a fixture
written afterwards is written to match the rule you happened to produce.

A fixture is a file under `testdata/fixtures/<language>/`, annotated the way
the corpus this was translated from annotates: `ruleid: <id>` on the line
before a line that must produce a finding, `ok: <id>` before one that must not.
The check is set equality. A rule that fires on a line nobody marked fails
exactly as loudly as one that misses a line, which is what makes the fixture
worth writing.

For C the fixtures are named for the weakness rather than for the rule —
`CWE-134.c`, not `uncontrolled-format-string.c` — so that going from a number
in an advisory to the code that causes it is one `ls`. Where a rule reports
something with no obvious number, use the nearest one and say in the header
which and why. Keep it to one file per rule; a fixture may only carry
annotations for the id its rule reports first.

Three things the checker will fail you on, all of which cost a cycle to
discover:

- The annotation must name the rule's **first** id, spelled exactly. A rule
  whose header says `double_free` and whose query reports `double-free` is a
  rule you cannot write a fixture for.
- Every fixture needs at least one `ok:`. A fixture with none cannot show the
  rule is not simply firing everywhere, and that is the failure mode that
  matters.
- The annotation marks the line the finding lands on, which is where the match
  *starts* — not where the interesting code is. A rule that matches a
  declaration and a use two statements apart reports the declaration, unless
  you move it with `focus`. Decide where you want the caret, then annotate
  there.

Write the fixture as documentation. A comment at the top saying what the
weakness is and why it bites gives the reader of a finding somewhere to go, and
it is the one place in the corpus where the code is allowed to be the
explanation.

## The vocabulary you will actually use

There are two dozen operators. These are the ones that appear in almost every
rule:

`scan_ast(globs; patterns)` is where a rule starts. One call, however many
patterns — the tree is walked once and each file parsed once, so a rule with
sixty alternatives costs what a rule with one costs. Inside a rule the input is
the path being searched, so the patterns go in as an argument:

```
["gets($$$_)", "strcpy($$$_)"] as $unbounded
| scan_ast("*.[ch]"; $unbounded)
```

not `["gets($$$_)"] | scan_ast("*.[ch]"; .)`, which quietly hands `scan_ast` an
array where a path belongs and fails at run time rather than at compile time.

`of(patterns)` splits the one walk back into the lists a rule needs. The
standard shape is one `scan_ast` bound to `$all` and then two or three readings
taken out of it:

```
| scan_ast("*.[ch]"; $uses + $checks) as $all
| ($all | of($uses) | ... )
```

`where_capture`, `where_capture_not`, `where_capture_ast`,
`where_capture_compare`, `where_capture_entropy` filter on what a hole caught.
`where_same` and `where_different` compare two holes to each other, which is
how a rule says "the buffer that was written is the buffer that was measured".
`where_text` and `where_text_not` do the same to the match itself.

`within`, `outside`, `not_at` and `at_same_place` compare spans, and they are
how one reading of the code subtracts from another. `not_at` is exact
coincidence; `outside` is "not enclosed by".

`focus(hole)` moves the finding onto a hole. It is the most useful operator in
the file and it does three separate jobs — see below.

`reaching(sources; sanitizers)` follows a value. `finding(id; message)` renders
matches. `report` orders them and drops duplicates that describe the same span.

## What the matcher will and will not take

Most of a day's work is learning which spellings of a pattern mean what you
think. `ast_pattern("...";"c")` compiles one and shows you the query and
whether it is code in that language at all, and it is the thing to reach for
the moment a pattern comes back empty — a typo and an honest absence look
identical from the outside.

**Arity is part of the pattern.** `f($A, $B)` is a call with two arguments.
`$$$_` is "and anything else here" and matches nothing as readily as it matches
something, so `printf($FMT, $$$_)` covers `printf(user)` and `printf(user, 1)`
both. That is usually what you want; where it is not, write the arity out.

The same property is worth exploiting: `$FN($$$_, $T *$P, $$$_)` matches a
one-parameter function as well as a five-parameter one, so a separate pattern
for the single parameter is twenty more patterns finding what you already
found.

**A C pattern is read as a statement as well as an expression.** This is what
makes `gets($BUF)` work at all — on its own it parses as a declaration, `gets`
the type and `($BUF)` the declarator. The consequence to remember is that
`setuid($X);` matches the call inside `if (setuid(u) != 0)` too, because that
is also a place the call could stand. Rules that care about position have to
subtract, and there is a technique for it below.

**Statement sequences work.** `A;\n$$$_\nB;` matches A and B in one statement
list with anything between, and the match spans from the first to the last.
This is the single most useful shape in the corpus, because most interesting C
bugs are a relationship between two statements. A lone trailing `$$$_` is
dropped from the query, so `free($V);\n$$$_` is just `free($V);` with a span
that stops there — a pattern that looks like it reaches forward and does not.
Two rules in this corpus were built on that and reported nothing for as long as
they existed.

**Declarations are not assignments.** `$P = malloc($$$_)` does not match
`char *p = malloc(64)`. Write both, or write `$T *$P = ...` when you want the
declaration specifically — which is often, because the declaration is also the
proof that `p` is a pointer.

**`sizeof x` and `sizeof(x)` are different syntax.** `sizeof($N)` matches only
the parenthesised form. `sizeof $N` matches both, and binds the parentheses
along with the name, so `$N` reads `(buf)`. That is harmless when you are
comparing `$N` to another hole and not harmless when you are comparing it to a
regex — guard with `where_capture_not("N"; "^\\(")` when it matters.

**A nested call in the only argument position does not match.**
`malloc(strlen($S))` compiles and finds nothing, while `foo(bar($A), $B)`
works. Reach for `where_capture_ast` instead:

```
| scan_ast("*.[ch]"; ["malloc($X)"])
| where_capture_ast("X"; "strlen($S)")
```

Note that `where_capture_ast` asks whether the pattern occurs *anywhere inside*
what the hole caught, not whether it is the whole of it — so it also matches
`strlen(a) + 1`. When you need the capture to be exactly one shape, use an
anchored regex on the text instead.

**Multi-dimensional arrays need their own reading.** `$T $B[$$$_];` binds `$B`
to `parts[4]` for `char parts[4][32];`. Write `$T $B[$_][$_];` for the two
dimensional case.

**Braces are optional in the pattern.** `if ($COND) { $$$BODY }` also matches
`if (c) return;`. You do not need a second pattern for the unbraced form.

**Casts, `#define` and struct access are all matchable.**
`(char *)$X == (char *)$Y`, `#define $NAME $VALUE` and `$P->$F = $_;` all
compile and all match. If a rule is reaching for a regex over something the
grammar has a node for, it is usually the wrong rule.

## The techniques

### Two statements as one construct

Most C weaknesses are not a call, they are a relationship. The buffer that was
allocated is the buffer that was used; the pointer that was freed is the
pointer that was dereferenced; the name that was declared is the name that was
returned. Match both statements in one pattern and require the two holes to be
the same name:

```
["$T $B[$$$_];\n$$$_\nreturn $R;"] as $automatic
| scan_ast("*.[ch]"; $automatic)
| where_same("B"; "R")
```

Write the two holes **apart** rather than writing one hole twice. A pattern
that says `$B` in both places means the same thing, but it leaves you only one
span, and you will want the second one to point the finding at.

The declaration has to be a sibling of the use for a pattern to see both. That
is a real limit — a file-scope array freed inside a function is the same bug
and is not reported — and it is the limit to accept rather than work around,
because the alternative is a rule that guesses.

### focus, job one: put the caret where the reader looks

The finding lands at the start of the match, which for a two-statement pattern
is the declaration. The line worth showing is usually the second one:

```
| where_same("B"; "R") | focus("R")
```

### focus, job two: make two readings subtract

This is the one that is not obvious and does most of the work.

To exclude a special case you write a second reading of the same code and take
it away with `not_at`. But `not_at` is exact span coincidence, and two readings
of the same statements almost never end in the same place — one ends at the
use, the other at the check. Focused onto the same hole, they do:

```
| ( ($all | of($uses) | focus("P"))
    | not_at($all | of($checks) | focus("P")) )
```

Both readings start at `$T *$P = malloc(...)` and end wherever their last
statement ends; focused onto `P` they are both the span of the pointer's name
in the declaration, and the subtraction works. This is how
`c-unchecked-allocation` tells an allocation that was checked from one that was
not, and how `c-returns-stack-address` subtracts `static` — which is not part
of the type, so no guard on `$T` can see it, but `static $T $B[...]` is the
same pattern with a word in front.

### focus, job three: collapse the pairings that `$$$_` invents

"Anything else here" between two statements will pair the first statement with
*every* later match of the second in the same block. One `sprintf` in a
function with four query calls after it is four matches on one line.

Focused onto a hole in the first statement they are one span, and `report`
drops the duplicates:

```
| where_same("BUF"; "Q")
| focus("BUF")
```

The same amplification is why an exclusion focused on the *shared* statement
can cancel the wrong thing. In `random-fd-exhaustion`, one `open` pairs with
every later `read` of that name, so a checked read further down the function
was cancelling an unchecked one just above it while both were reported at the
open they shared. Focused onto the read, each pairing cancels only itself. The
rule of thumb: **focus onto whichever statement the finding is about.**

### Splice the exclusion into the same reading

`not_at` is order-blind. `free(p); use(p); p = NULL;` and
`free(p); p = NULL; use(p);` produce the same two matches, and a guard written
as "a free followed by a reassignment" forgives both.

When order matters, write the exclusion as a **longer reading of the same
code** with the extra statement in the middle:

```
| ($touch | map("free($P);\n$$$_\n" + .)) as $uses
| ($touch | map("free($P);\n$$$_\n$P = $_;\n$$$_\n" + .)) as $renewed
```

Being a strictly longer reading, it cancels exactly the pairs where the
reassignment is between the free and the use, which is the question.

### "Was the result checked" is a question about position

A call whose value goes nowhere is a statement. A call whose value is used sits
in a condition, an initialiser or a return. So the rule is the bare statement
minus the places a value can be used:

```
| ["if ($COND) $$$_", "while ($COND) $$$_", ...] as $tests
| ( $all | of($bare)
    | outside($all | of($tests) | focus("COND"))
    | outside($all | of($used)) )
```

Subtract the condition **focused onto itself**, not the whole `if`. Focused,
the `if` covers its test and not its branch, so `if (setuid(u) != 0)` cancels
and `if (x) { setuid(u); }` — a call that is inside an if and still unchecked —
does not. Remember to list the cast spellings in `$used`:
`return (int)read(...)` is a checked read and `return read(...)` is a different
construct.

### The function body as text

Sometimes the thing you need to know is a fact about the whole function, and
the two statements are never siblings because each is wrapped in its own `if`.
Capture the body and read it with a regex:

```
| ["$RT $FN($$$_) { $$$BODY }"] as $funcs
| ( $all | of($jails)
    | outside($all | of($funcs)
              | where_capture("BODY"; "chdir\\s*\\(\\s*\"/\"\\s*\\)")) )
```

This is coarser than a pattern and occasionally that is exactly right. A
`chroot` in a function that never mentions `chdir("/")` is the finding; where
the body does mention it, the rule stops asking, because it is not going to
tell a programmer who checked both calls that they checked them in the wrong
order. Use it deliberately, say in the header that you did, and do not reach
for it when the grammar has a node for what you want.

### Build the cross product with map

When a rule is "these twenty calls, in these three contexts", write the twenty
and generate the sixty:

```
["memset($_, $_, sizeof($N));", "fgets($_, sizeof($N), $_);", ...] as $uses
| ( ($uses | map("$RT $FN($$$_, $T *$P, $$$_) {\n$$$_\n" + . + "\n$$$_\n}"))
    + ($uses | map("$T *$P = $_;\n$$$_\n" + .))
    + ($uses | map("$T *$P;\n$$$_\n" + .)) ) as $pats
```

`scan_ast` walks the tree once for all of them. It is not free — sixty patterns
is a few seconds over a hundred kilobytes of C where a single-pattern rule is
half of that — so trim readings that another reading already covers, and do not
generate a cross product where a hole would do.

### Following a value

Some rules have no finding at either end. Reading `argv` is what a program
does; opening a file is what a program does; the finding is that the one
reached the other. That is `reaching`:

```
| scan_ast("*.[ch]"; $outside + $opens + $clean) as $all
| ( $all | of($opens)
    | reaching($all | of($outside); $all | of($clean)) )
```

Two things to know before you build a rule on it.

It is intraprocedural and syntactic. It knows assignment. It does not know what
a library does with an argument, so a path built with `snprintf` into a char
array is the same bug and is not reported — the taint went in through an
out-parameter and came back as a name nothing was seen to assign. Where the
value travels through a buffer, do not use `reaching`; read the two statements
together and require the buffer to be the same buffer, which is what
`c-sql-built-by-sprintf` does.

And **focus before you follow**, when the sink is bigger than the part you care
about. Following a value asks which names are written inside the match, and a
whole subscript contains the array's name as well as the index's — so a
constant index into a buffer that came from outside comes back tainted.
`focus("I")` first, and the question asked is the question meant.

Name sanitizers honestly. `realpath` and `basename` are named in the path rule
not because either forbids a traversal — `realpath` resolves `..`, it does not
reject it — but because after them there is something to compare, and that is
where syntax stops and the rule should stop with it.

## Guards on captures

A capture is text, and the guard is usually a regex over it. Anchor it. The
first version of `c-broken-crypto-algorithm` matched `EVP_sha256()` with
`^EVP_sha1?` — "sha" then an optional 1 — and reported the correct algorithm as
a broken one. Anchor to the syntax that follows: `^EVP_(?:md5|sha|sha1)\(`.

Prefer a regex to a comparison when the values are not ordered by how dangerous
they are. `where_capture_compare` reads a hole as a number in whatever base it
was written, which is the right tool for "a timeout larger than an hour" and
the wrong one for file modes: 0644 and 0620 are not ordered by danger, and only
one of them is a problem. The question there is one octal digit — does the last
one carry the write bit, which is `[2367]` — and a regex asks it exactly.

A literal argument is the safe spelling in a surprising number of C weaknesses,
which is what makes them checkable without following anything. `^L?"` is "this
is a string literal"; `^(?:L?\"|u8\"|_\(\s*L?\")` covers the wide and
translated spellings too.

## The message

`finding` renders `$NAME` from the hole of that name — and leaves a name no
hole has exactly as written. So a message that says `$NAME` will print
`$NAME` on the alternatives whose pattern has no `$NAME`. Only use a hole that
every alternative binds, and read the actual output before you commit:

```
$PWRQ -n -c '[invoke_pwrgrep($fixture; $rule) | {l: .LineNumber, m: .Message}]'
```

Write the sentence for someone who has just been shown a line of their own code
and does not yet believe there is anything wrong with it. Say what the code
does, not what category it is in, and name the fix if there is a one-word one.
"this hash is not collision resistant; SHA-256 or SHA-3 instead" is a finding.
"Use of weak cryptographic algorithm" is a taxonomy entry.

## Deciding what not to report

The corpus's bias is to report less. A rule that fires on careful code teaches
people to skip the whole rule, and then it is worse than not having been
written.

Concretely, in this pass:

- `c-loop-runs-one-past-the-end` will not report `i <= last`, which is correct
  code that looks identical to the bug. It reports `i <= count`,
  `i <= strlen(s)`, `i <= sizeof(buf)` — a bound that is a length by
  construction or is named like one — and only where the body writes through a
  subscript.
- `c-allocation-size-overflow` holds addition to a stricter test than
  multiplication, because `malloc(len + 1)` is how a C program leaves room for
  a NUL and reporting it would bury the case that matters.
- `c-cleared-buffer-is-a-dead-store` requires the clear and the free to be
  adjacent. With a gap allowed, a live store reads as the same shape.
- `c-uninitialized-read` deliberately does *not* subtract a variable assigned
  on one path and read after it, because reading it is uninitialised on the
  other path. That one is the bug, not a false positive — the distinction is
  worth making explicitly in the header, since the next reader will assume it
  was an oversight.

And a rule that a wider rule strictly contains should go. Two rules reporting
one line under two ids is worse than one, and the README records the precedent
for removing them.

## Say why in the header

The header is the whole of a rule's metadata and it is comments inside the
query, so that moving a rule moves everything about it. `# rules:` is the only
line a rule cannot omit; `# languages:`, `# fixture:` and `# from:` are checked
by CI (`# from:` for existence — every rule must say where it came from).

Underneath them, write the prose. Not what the rule matches — the query says
that — but why the code is wrong, why the safe spelling is safe, and which
judgement calls you made. The prose is where a reader finds out that `static`
is subtracted as a second reading rather than filtered out of the first, or
that adjacency was chosen over a gap on purpose, and it is the difference
between a rule someone can maintain and a rule someone will rewrite.

## Run it over code nobody wrote it for

A fixture proves a rule fires where you meant. It cannot tell you the rule
fires everywhere else too, because you wrote the file.

Point the rule at real source before you commit — a vendored dependency, a Go
module cache, anything of a few thousand lines — and read every finding:

```
$PWRQ -n -r '[invoke_pwrgrep("/path/to/real/source"; "c")]
             | .[] | "\(.RuleId) \(.Path):\(.LineNumber) \(.Match)"'
```

Twelve hundred lines of sqlite's `mptest.c` found two noise sources in this
pass that no fixture would have. `va_start` initialises a `va_list` and does
not look like it — the list goes in by name rather than by address, so nothing
in the call says it is written to; it is a macro, and it does. And the taint
question was being asked of a whole subscript rather than of its index. Both
were one line to fix and neither was visible from inside the fixture.

Also read the counts. A rule reporting a hundred findings in one file is
telling you something about itself.

## Before you commit

```
PWRQ=../pwrq/pwrq tools/validate.py
```

The full run, not `--no-smoke`. The smoke test is the check a compile cannot
make: a query that parses can still fail on the first match it is given — a
regex RE2 will not take, a comparison the operator cannot read — and that is
worse than a rule that was never shipped, because it takes the whole run down
with it.

Then the checklist:

- Every rule you touched has a fixture, and the fixture has at least one `ok:`.
- Every finding message reads correctly on every alternative, checked by
  reading the output rather than the template.
- The header says why, and `# from:` says where it came from.
- No fixture is orphaned and no rule names one that is not there — CI checks
  both, but knowing which one you broke is faster than being told.
- The rule has been run over source that was not written for it.

## Do not trust a rule that has no fixture

The last thing, and it is the reason this document exists.

Three rules in the C corpus did not work. `use-after-free` and
`function-use-after-free` were both built on `within(free($VAR); $$$_)` —
that trailing "anything else here" is dropped from the compiled query, so the
span covered the free and stopped there and no later use was ever inside it.
`c-string-equality` looked for `(char *a) == (char *b)`, which is not how a
cast is written in C. All three compiled. All three ran. All three reported
nothing, on any input, ever.

That is the failure a rule cannot be read for, and a fixture is the only thing
that finds it. If you are adding a rule beside an existing one that has no
fixture, spend five minutes pointing the old one at code it should fire on
before you assume the gap in coverage is where you think it is.
