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

**Arity is part of the pattern, with one exception.** `f($A, $B)` is a call
with two arguments. `$$$_` is "and anything else here" and matches nothing as
readily as it matches something, so `printf($FMT, $$$_)` covers `printf(user)`
and `printf(user, 1)` both. That is usually what you want; where it is not,
write the arity out.

The exception is a **lone anonymous hole**, and it is silent. `f($_)` compiles
to `arguments: (_)` with no anchors — an argument list, any argument list — so
it means exactly what `f($$$_)` means and not what it looks like it says. Two
of them anchor correctly (`f($_, $_)` is `. (_) . (_) .`), and a single *named*
hole anchors too (`f($K)` is `. (_) @K .`); it is only the one-argument
anonymous case that degrades. This is the same in C, Go, Python and Java,
because it happens in the compiler and not in a grammar.

It costs findings the way a false name does. `getParameter($_)` as a source
matched Apache Tiles' three-argument
`runtime.getParameter("value", Object.class, null)`, which is not a servlet
request at all, and a Java SSRF rule reported twenty-two findings in the Tiles
plugin. Naming the hole `$K` took it to zero. **When a pattern is meant to pin
arity, give every hole a name.**

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

## The matcher is not the same in every language

Everything above was learned in C. Almost none of it transferred to PHP
unchanged, and the way it failed was silent in every case, so check these
before writing a rule in a language nobody has written one in yet.

**Every PHP pattern needs a named hole.** `eval($$$_)`, `phpinfo($$$_)`,
`system($_)`, `foo()` — a pattern whose arguments contain no `$NAME` is not
read as PHP at all. The grammar takes it for inline HTML text, and the query
becomes a search for those characters verbatim, which matches nothing in any
PHP ever written. `ast_pattern` reports `Valid: true` and shows you
`(_) @_lit_1 (#eq? @_lit_1 "eval(__GREP_VAR____);")`, which is the tell.

This ran through most of the PHP corpus: eleven rules — eval-use, exec-use,
unserialize-use, phpinfo-use, unlink-use and the rest — could not fire on any
input. The spelling that works is a hole in the function position with a guard
on what it caught:

```
["$F($CODE)", "$F($CODE, $$$_)"] as $calls
| scan_ast("*.php"; $calls)
| where_capture("F"; "^(?:eval|create_function)$")
```

which is the shape you want anyway when a rule is about a list of names. Where
you need a fixed arity, give every argument a name — `setcookie($N, $V)`, not
`setcookie($_, $_)`, which has no named hole and so is not PHP either.

**`$$$_` between statements is not an ellipsis in PHP.** In C,
`A;\n$$$_\nB;` is the workhorse. In PHP the same pattern compiles the middle
line to a call with empty parentheses:

```
(expression_statement . (function_call_expression (_) @_ arguments: (arguments) @_lit_3) .)
(#eq? @_lit_3 "()")
```

so it can never match. Adjacent statements (`A;\nB;`) work. For anything with
a gap, use `reaching` instead — and focus the source onto the part that sits
inside the assignment's right-hand side, or the name on the left will not pick
the taint up:

```
| ($all | of(["$V = $S;"]) | where_capture("S"; $sql) | focus("S")) as $assembled
| ($all | of($sinks) | reaching($assembled; []))
```

**Some constructs have no reading at all.** `echo`, `print`, `include`,
`require` and `exit` are PHP language constructs rather than calls, and
neither `echo $X;` nor `<?php echo $X;` compiles to anything that finds one —
the second silently drops the keyword and matches the file's first statement.
When the grammar has no node a pattern can name, `scan_regex` is the right
tool and not a shortcut; say so in the header and leave `# languages:` empty,
because the patterns are not code in anything.

The cost is real and should be stated in the rule: a regex sink cannot be the
sink of a `reaching`, because following a value needs a parsed file. So the
PHP XSS rule reports `echo $_GET['q']` and does not report
`$name = $_GET['q']; echo $name;`, and its header says so.

**A superglobal written in a pattern is a hole.** `$_GET[$K]` binds a capture
called `_GET`, and it matches `$_POST` and `$_COOKIE` too. That is usually
convenient — one pattern for every superglobal, with the name available to
filter on — but it is not what the pattern looks like it says:

```
| where_capture("_GET"; "^\\$_(?:GET|POST|REQUEST|COOKIE)$")
```

**How far a hole is folded depends on what is around it.** `md5($ARG)` binds
`$ARG` to the argument; `$x = md5($ARG);` binds it to the parenthesised
argument list. So two readings of the same call can be impossible to bring to
the same span, and the focus-and-subtract technique above does not apply. When
that happens, make the readings disjoint by construction instead — ask the two
questions of sets that cannot overlap — rather than trying to cancel one
against the other.

**Read the literals the way the language does.** PHP single quotes interpolate
nothing, so `eval('$e = new Exception($this->message); throw $e;')` is a
constant however many dollars are in it — PEAR contains exactly that, and a
"contains a `$`" test reported it. Double quotes are the opposite: a `$` or a
`{` in one is code.

## Go is the one that reads like C

The Go pass expected to spend its first day on the same discovery PHP forced,
and did not. Almost everything in "What the matcher will and will not take"
transferred: a call with no named hole is read as Go, `gets($$$_)` style
patterns compile, statement sequences work, and the trailing `$$$_` is dropped
exactly as it is in C, so `resp.Body.Close()\n$$$_` still stops at the close
and reaches forward to nothing.

Two things are better than C, and are worth knowing before writing a rule
around the absence of them:

**A nested call in the only argument position matches.** `int32(len($S))`
finds `int32(len(b))`, where the C equivalent compiles and finds nothing.
`where_capture_ast` is still the tool when the hole may hold the call among
other things, but the direct spelling is available and says more.

**`reaching` follows a two-value assignment.** `n, err := strconv.Atoi(s)`
taints `n`, which is what makes any rule about a parsed number possible at
all. Go writes almost every interesting source that way, so a corpus that had
to name the single-value form would have nothing to say.

Three things are worse. All three are silent when the rule runs - the query
compiles or is skipped, the pipeline produces an empty array - and only the
first of them is something `ast_pattern` will tell you about, which is the
argument for compiling a pattern the moment it comes back empty.

**An anonymous ellipsis standing as a braced body collides with a standalone
one.** This is the Go gotcha, it costs an afternoon, and the minimal pair is:

```
if $C { $$$_ }     invalid: "the item below an ellipsis taken into it"
$$$_
a()

if $C { $$$BODY }  valid, and matches what it looks like it matches
$$$_
a()
```

Both ellipses read as a body ellipsis, so the standalone one is taken into the
block rather than left as a gap. What is left will not scaffold into a
function, and the query ends up rooted at `source_file` — where Go has no
statements at all, so it can never match anything. `ast_pattern` says
`Valid: false` and names the problem, which is the only reason this is an
afternoon rather than a rule that reports nothing for as long as it exists. Naming the body hole fixes it in every case: `for`, `if`, `func` and
`go func` all behave once the body is `$$$BODY` rather than `$$$_`. Two
anonymous ellipses are only a problem when one of them is a body; `for $$$_ {
$$$B }` beside a gap is fine.

**`$NAME: $VALUE` is a labeled statement.** Go has labels, the grammar prefers
them, and the pattern compiles to `(labeled_statement ...)` — valid, and never
what a rule about struct fields meant. Write the literal around it:
`$T{$NAME: $VALUE}` compiles to a `keyed_element` and matches.

**A pattern rooted at the enclosing node gives one match per node.** Which
means only the first field of a composite literal is ever bound:
`$T{$$$_, $NAME: $VALUE, $$$_}` looks like it reads every keyed element and
reads the first one, whatever the ellipses either side suggest. There is no
spelling that roots the match at the element, so a rule about struct fields
either matches single-field literals — `$T{$NAME: $VALUE}`, which is honest
about what it finds — or says in its header that it reads one field. This is
worth checking for in any language whose interesting construct is a list of
children.

A fourth was worse until this pass fixed it, and it is written down because
the shape will come back in another grammar. `reaching` binds a source to the
name of any assignment whose right-hand side contains it, and it used to ask
that of every ancestor - so a source read inside a closure was reported as
having been given to whatever the closure was assigned to:

```
inner := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        if r.Header.Get("X-Fail") != "" { ... }
})
ts := httptest.NewServer(logRequests(logger, inner))
req, _ := http.NewRequest(http.MethodGet, ts.URL, nil)
```

`inner` was tainted by the header, `ts` by `inner`, and an SSRF rule reported a
test server's own address. What `inner` was given is a function. The walk up
from a source now stops at the function the source was written in - a node
with both parameters and a body, which is what tells a closure from a `for`
and from a Python comprehension, both of which have a body and are real paths
a value travels along. If a rule of yours reports something built from a
handler rather than from a request, check the binary is new enough to have
this.

## Java is the one where the class body is out of reach

Java was the easiest grammar in this corpus to write patterns against and the
one with the most surprising hole in it. Almost everything compiles the way
you would guess: bare calls (`foo($X)`), statement sequences
(`a($X);\n$$$_\nb($X);`), method scaffolds (`$RT $M($$$_) { $$$BODY }`, which
matches a method with modifiers and a `throws` clause without being told about
either), `try`/`catch`, try-with-resources, annotations above a method, and
lambdas. A nested call in the sole argument position matches, as in Go and
unlike in C. `reaching` works out of the box, because tree-sitter-java spells
an assignment `left`/`right` and a declaration `name`/`value` and the taint
engine knows both.

That last point is the reason Java was worth a pass at all. The corpus had
ninety-seven Java rules and exactly **one** of them followed a value, against
forty-nine in Python and forty-eight in JavaScript — in the language whose
entire security literature is "untrusted input reaches a dangerous sink". The
rules were there; the shape that makes them worth having was not.

**A field declaration cannot be matched.** This is the one to know before you
plan a rule.

```
$T $F = $E;                         → (local_variable_declaration ...)
private static final $T $F = $E;    → (local_variable_declaration ...)
```

A pattern that is not a whole Java file is wrapped in a scaffold, and the
block scaffold (`{ ... }`) is tried before the class one, so a declaration
always reads as a local. `private` on a local is not legal Java and the
grammar takes it anyway, so even the modifiers do not push it over. Wrapping
it yourself does not help either: `class $CN { $T $F = $E; }` does compile to
a `field_declaration`, but anchored as the *only* member of the class body,
and putting `$$$_` beside it is either an error or reads the ellipsis into the
field's own type.

So `private static final String PASSWORD = "hunter2";` — the canonical
spelling of the weakness — is not reachable, and two rules in this pass say so
in their headers rather than pretending otherwise. What is reachable is the
local, the argument and the expression, which is what those rules ask about.

**A modifier list is compared as one string.** `private static final $T $F`
compiles to `(modifiers) @_lit_1` with `(#eq? @_lit_1 "private static final")`,
so `static private final` does not match it and neither does anything with a
fourth word. Match on the modifiers only when you mean that exact spelling.

**A bare `catch` is not a catch.** `catch ($T $E) { }` on its own compiles to a
method call named `catch` with two arguments, followed by a block. Write the
`try` around it. `try { $$$B } catch ($T $E) { $$$C }` is correct and binds
both bodies.

**A body written `{ }` is a text comparison.** In that pattern `{ }` becomes
`(#eq? @_lit "{ }")`, which is *not* the same as an empty block — a real one
is usually `{\n        }`. Ask the question with a guard on the body capture
instead: `where_capture("C"; "^\\{\\s*\\}$")` matches every spelling of
empty, and a comment inside keeps it from matching, which for that rule was
the behaviour worth having.

**try-with-resources is a different node.** A resource declared in a
`try (...)` header is a `resource`, not a `local_variable_declaration`, so
`$T $V = new FileInputStream($$$_);` does not match it. A rule about unclosed
streams therefore needs no subtraction for the correct spelling — the safe
form is invisible to it by construction. That is rare and worth noticing when
it happens, because it is the cheapest kind of exclusion there is.

### Two engine bugs Java found, and both were everybody's

Neither of these is a Java problem. Java was just the first language in this
corpus whose rules leaned on `reaching` hard enough to hit them.

**A loop never bound its variable.** `for (ZipEntry entry : zip.entries())` is
an assignment — the grammar says `name`/`value` — but the node that assigns
*encloses the body that uses the name*. The binding was recorded at the end of
the node, so every use of the loop variable happened before the variable was
given its value, and no value that arrived through a loop was ever followed.
The same was true of `for name in request.args.getlist("f")` in Python, and of
every other language here. Recording the binding at the end of the *value*
fixes it: between the value and the body there is nothing a name can be used
in, and an ordinary assignment reads exactly as it did.

**Propagation ignored scope.** A tainted name spread to anything assigned from
anything mentioning that name, anywhere in the file, with no test that the two
were the same variable. Local names repeat — `name`, `path`, `url`, `value`,
`dt` — so a servlet with one method that opens a request parameter and another
that opens a constant reported the constant. Python's `http/cookiejar.py` has
four functions that each declare a local `dt`, and the corpus reported a
format string in all four. Propagation now applies the same three-part test
the sink already used: the same name, given its value earlier, in a body that
contains this use.

Both are fixed in xen0bit/pwrq#49. Over three trees of real Python and Go the
two changes together removed six findings and added none, and the flows the
rules are actually for still fire.

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
- `java-exception-swallowed` reports an empty catch only where the exception
  is bound to a throwaway name. `catch (ClassCastException tolerated) {}` is a
  decision, and so is a comment in the block; both are left alone.
- `java-path-from-untrusted-input` reports where the path is *built* and not
  where it is opened, because a method that does both is one bug and reporting
  it twice puts the second finding on the line after the one that matters.
- `java-securerandom-told-what-to-produce` deliberately over-reports: `setSeed`
  after the generator has produced output is harmless, nothing in the syntax
  says which came first, and the direction that costs a false positive is
  better than the one that costs a predictable key.
- `java-credential-is-a-literal` does not report `""` (a local database with no
  password), `${db.password}` (a placeholder, which is the fix) or the word
  `"password"` itself. It does report `"changeit"`, which is the default
  password of every Java keystore and is the point.

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

The Go pass had the same thing happen an order of magnitude louder, and it is
the strongest argument in this document for doing this before you commit. A
rule about unclosed HTTP response bodies passed its fixture, read correctly,
and reported **a thousand findings in one module** - `google/go-github`, which
hangs its whole API off a field called `client` and closes every body itself.
`s.client.Do(ctx, req, repo)` satisfied `$C.Do($$$_)` with a receiver named
`client`, and nothing about the rule or its fixture could ever have said so.

The fix was arity. net/http's `Do` takes one argument; an SDK method called
`Do` takes a context first. Writing the signature out - `$C.Do($REQ)`, not
`$C.Do($$$_)` - took the module from a thousand findings to three. When a
pattern names a method that a hundred libraries also define, the parameter
list is the only thing in the syntax that says which one you meant.

The remaining three were all one shape: the function dealt with the body
somewhere the pattern could not see - in a branch, or by handing it back to
its caller. That is what moved the question from the statement to the whole
function body, and it is the same trade `chroot-without-chdir` makes.

The Java pass ran twelve rules over six repositories nobody wrote them for —
spring-framework, Struts, Guava, commons-io, commons-compress and
spring-petclinic, about fifteen thousand files — and the first run reported
two hundred and fifty-six findings. Reading them found six causes, and every
one of them was a rule saying something slightly different from what it meant:

- Guava writes `catch (ClassCastException tolerated) {}` and
  `catch (NullPointerException optional) {}` a hundred and fifty times. **The
  name is the comment**, and a better one than a comment, because the compiler
  keeps it beside the type. The rule now reports an empty catch only when the
  exception is bound to a name that says nothing — `e`, `ex`, `t`, `error` —
  which is an inclusion list because that set is small and closed and the set
  of meaningful names is neither.
- commons-io's `CopyUtils` wraps six streams it does not own.
  `new InputStreamReader(input, charset)` holds no descriptor; closing it
  closes the caller's. Wrapper types are now matched only where their argument
  opens something fresh.
- Spring's test suite parses XML it built itself, in memory, as a String —
  fifty-eight findings in four files. XML the program wrote cannot contain an
  entity the program did not put there.
- Spring's own suite writes `setPassword("password")` twenty-three times. A
  literal that is the *name* of the thing is not a value of it.
- `URI.create(request.getRequestURI())` is not SSRF, because a request's own
  path is not a host. Wrong sources, not a wrong sink.
- and the lone anonymous hole above, which is the one that could not have been
  found by reading.

Two hundred and fifty-six became fifty-four, spring-petclinic — a clean
application — reported nothing at all, and the single finding in the whole of
spring-framework's main source was the one Spring's own authors had annotated
with a comment explaining why they accepted it. None of the six was visible
from inside a fixture.

Also read the counts. A rule reporting a hundred findings in one file is
telling you something about itself, and one reporting a thousand across a
module is telling you it has matched a name rather than a thing.

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

Fourteen rules across two languages did not work.

Three in C. `use-after-free` and
`function-use-after-free` were both built on `within(free($VAR); $$$_)` —
that trailing "anything else here" is dropped from the compiled query, so the
span covered the free and stopped there and no later use was ever inside it.
`c-string-equality` looked for `(char *a) == (char *b)`, which is not how a
cast is written in C. All three compiled. All three ran. All three reported
nothing, on any input, ever.

Eleven in PHP, all from one cause: a pattern with no named hole in its
arguments, which the grammar does not read as PHP. And one more, php-ssrf,
failing the other way — `$FUNCS($$$_,$DATA, $$$_);` with nothing said about
either hole is every call with two or more arguments, and it reported sixteen
findings on an eighteen-line file.

That is the failure a rule cannot be read for, and a fixture is the only thing
that finds it. If you are adding a rule beside an existing one that has no
fixture, spend five minutes pointing the old one at code it should fire on
before you assume the gap in coverage is where you think it is. In PHP that
five minutes would have saved a corpus.
