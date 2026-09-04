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

## Java is the one where a declaration has three names

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

**A declaration is three node types, and a pattern is read as all of them.**
This one was a limitation first and is now a feature, and the story is worth
having because the limitation was invisible.

```
$T $F = $E;    → (local_variable_declaration ...)   a local
               → (field_declaration ...)            a field
               → (constant_declaration ...)         a constant in an interface
```

The first of those is what the pattern compiles to on its own, because
tree-sitter-java takes a bare statement at the top of a file — so the pattern
parses, reports no problem, and no scaffolded reading is ever reached for. The
identical text inside a class body is a `field_declaration`: the same children
under a different name, and a query for one matches neither of the others.

Nothing said so. `ast_pattern` showed a valid query, the rule ran, and
`private static final String PASSWORD = "hunter2"` — the shape every
hardcoded-credential rule in the world is about — was not reported, for the
same reason a typo is not reported. Two rules in the Java pass documented it
in their headers, which is the right thing to do about a limit you cannot fix
and the wrong thing to leave standing when you can.

It is fixed in xen0bit/pwrq#51. A pattern is now read a second time inside the
things a grammar lets hold members, and where the same children come back
under a different node type that type becomes another reading. `compiled`
already held a list of readings for exactly this — C's `gets($BUF)` has been
read as a call and as a declaration since the beginning — so a match under any
of them is a match, and the same span found twice is one finding.

The other names are measured rather than listed, which is what keeps it from
being a table of 206 grammars: a language that calls a declaration the same
thing in both places produces the same head and gets no second reading, and
that is every language in this build except the ones shaped like Java.

**So check `Queries`, not `Query`.** `ast_pattern` reports the first reading in
`Query` and all of them in `Queries`, and for a pattern with more than one the
first is not the whole story — which is the failure this whole document is
about, arrived at from inside the tool meant to prevent it.

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

Neither of these is a Java problem — the declaration one above is Java's, and
these two are not. Java was just the first language in this corpus whose rules
leaned on `reaching` hard enough to hit them.

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

## C# is the one that thinks a fragment is a program

Every pattern in this section compiled, reported `Valid: true`, and matched
nothing. That is the whole character of the language: C# does not refuse the
patterns it cannot read, it accepts them and answers no.

**A statement is wrapped in a node that exists only at the top of a file.**
Since C# 9 a file may be nothing but statements, so `Console.WriteLine($X);`
parses standing alone — cleanly, no error, no complaint — and the least
invasive scaffold therefore wins. But the grammar wraps each top-level
statement in a `global_statement`, so the query is

```
(global_statement . (expression_statement . (invocation_expression ...) .) .)
```

which matches a file with no class in it and nothing else:

```csharp
class T { void f() { Console.WriteLine(q); } }   // no match
Console.WriteLine(q);                            // match
```

**Ninety-four of the hundred and sixty-nine C# patterns in this corpus** —
every call, every assignment, every `using` — compiled to that and found
nothing in twenty-two thousand files. This is fixed in xen0bit/pwrq#53: the
wrapped reading is replaced by the pattern read inside a function body, and
for a member pattern inside a class body. Twenty-two patterns are still out of
reach and none of them should be rescued; see below.

**A dotted call needs its semicolon.** `$R.Execute($X)` is not C#. A dotted
name at file scope is a *type* — `System.Console` — so the grammar reads the
pattern as a `qualified_name` and reports an ERROR. `$R.Execute($X);` is the
call. This one is loud, which makes it the friendliest trap in the language:

```
| ["$E.HtmlEncode($X, $$$_);", "$T $V = $E.HtmlEncode($X, $$$_);"] as $clean
```

Both spellings, because a hole receiver needs a *position* — a statement or
the right-hand side of a declaration — and an encoder is called in both. A
fully-qualified literal receiver does not parse either, so
`System.Net.WebUtility.HtmlEncode($X)` has to be reached through the hole.

**An indexer cannot stand alone.** `Request.Query[$K]` — the single most
important taint source in ASP.NET — reads as an *array type*, `Request.Query[]`,
and is refused. Read it off the right-hand side of a declaration instead:

```
| ["$T $V = $S;"] as $assigned
| "Request\s*\.\s*(Query|Form|Headers|Cookies|QueryString)\b" as $fromRequest
| ($all | of($assigned) | where_capture("S"; $fromRequest) | focus("S"))
```

**`try`/`catch` cannot be matched at all.** Every spelling —
`try { $$$_ } catch ($T $E) { $$$_ }`, the catch alone, with or without the
binding — compiles to a search for a *call to a function named `catch`*:

```
(invocation_expression function: (identifier) @_lit_4
  arguments: (argument_list . (argument . (declaration_expression ...) .) .))
(#eq? @_lit_4 "catch")
```

and reports itself valid. Java takes the same pattern correctly. There is no
workaround inside the matcher; `scan_regex` is the honest tool, and the empty
catch rule this corpus has for Java has no C# counterpart for that reason.

**A single hole in argument position also matches any arity.** This is the one
that will cost you a false positive rather than a silent miss, so it is worth
internalising:

```
File.ReadAllText($P)        ->  binds "p", and also binds "(p, e)"
File.ReadAllText($P, $$$_)  ->  binds "p", both times
```

The pattern compiles to two readings and the second is `arguments: (_) @P`,
unanchored. `Path.Combine($P)` on `Path.Combine(root, name)` therefore reports
`(root, name)`, at the wrong column and for the wrong reason. **Write `$$$_`
beside every named argument hole in C#.**

**A keyword in front of a statement can be dropped.** This was a bug in the
first version of the reading fix and is worth knowing as a shape: anchoring
descends past the nodes a grammar wraps a construct in, and it cannot tell
those from the nodes that *say* something.

```
throw new $E($$$_);          ->  (object_creation_expression ...)
using ($T $V = $E) { $$$_ }  ->  (variable_declaration ...)
```

— a search for every `new` and for every declaration in the program. Both are
now refused rather than answered wrongly, so `using ($T $V = $E) { $$$_ }`
works and `throw new $E($$$_);` finds nothing.

**Three things have no reading, and should not get one.** The C# 8 using
declaration (`using var s = ...;`), a property with an initialiser
(`public string S { get; set; } = "x";`, whose reading anchors to a class whose
body is that one property), and any multi-statement pattern —
`$A = 1;\n$$$_\n$B = 2;` is read with `$B` for a type and the assignment for a
declarator. Where you need one of those, guard on the method's text instead
and say in the header that you did:

```
| "\\.\\s*(?:Dispose|Close)\\s*\\(|\\busing\\s+var\\b" as $disposes
| outside($all | of($methods) | where_capture("BODY"; $disposes))
```

That is coarser than a structural test — a method that closes one stream and
leaks another goes unreported — and erring quiet is the right direction for a
resource rule.

### A method body's text includes its comments

Not a C# fact, but this is where it bit. A rule guarded on `where_capture("BODY"; ...)`
reads the comments too, so a guard looking for the word `secret` matched the
fixture's own `// ok:` annotation and the rule fired on the line asserting it
must not. Guard on the names — `$M`, `$V` — when the question is about names:

```
| within( ($all | of($methods) | where_capture("M"; $namesASecret))
          + ($all | of($assigned) | where_capture("V"; $namesASecret)) )
```

### Two more holes in the taint engine, and C# had no dataflow without them

`reaching` returned nothing for any C# file, for two independent reasons, and
the eight corpus rules that use it were dead on both counts as well as on the
reading one.

**A C# declaration binds no value.** `variable_declarator` gives the name a
field and leaves the initialiser an ordinary child:

```
variable_declarator [name=identifier] "name = Request.Query[\"n\"]"
  identifier                          "name"
  element_access_expression           "Request.Query[\"n\"]"
```

so none of the `left`/`right`, `name`/`value` pairs the engine knows match, and
a declaration — how nearly every value in a C# program is introduced — carried
nothing. Same hole `declarator`/`value` was added to fill for C, one step
further along: there the field existed under another name, here there is no
field.

**A source that *is* a name tainted nothing.** ASP.NET binds a controller
action's arguments from the query string, the route and the body:

```csharp
public IActionResult ByCity(string city)
```

`city` came from the caller, and there is no accessor in the method to point at
instead — which is how every C# web framework written since about 2016 spells
it. The walk up from a source asks what the source was *given to*, and a
parameter was given to nothing. A rule that knew only `Request.Query` missed
every controller written this decade.

Both are fixed in xen0bit/pwrq#53, and the parameter half helps every language:
`focus("P")` on a method pattern is now a usable source anywhere.

## Kotlin is the one that labels nothing

Kotlin took the fewest surprises of any language here and the two it had were
both invisible, both engine bugs, and between them they made most of the
corpus's rule shapes unwritable. Everything in "What the matcher will and will
not take" transferred: bare calls compile, statement sequences work with one
gap or with two, a nested call in the sole argument position matches, a single
named hole in argument position pins the arity the way it does in C and Go and
not the way it does in C#, and the safe-call operator is transparent - `$I.f($X)`
matches `intent.data?.f("x")` without being told about the `?.`.

Three things are worth knowing before writing a rule, and then two engine
fixes.

**A body is one node, so it takes one hole.** `fun $F($$$_) { $$$BODY }` is
invalid - the ellipsis stands beside other children and there is nothing for a
run of them to be bound to - and the spelling that works is
`fun $F($$$_) { $BODY }`. It matches a function with a return type, with
modifiers and with an expression body, and `$BODY` is the whole of the block
including its braces. Class bodies behave the same way: `class $C { $$$_ }` is
what compiles.

**An ellipsis before a named parameter is not an ellipsis.**

```
fun $F($P: String, $$$_) { $BODY }   valid, and binds the first parameter
fun $F($$$_, $P: String) { $BODY }   ERROR: `, __GREP_CAP_P__` compared as text
```

So a parameter pattern reaches the first parameter and no other. The C# corpus
writes `public $T $M($$$_, string $P, $$$_)` and there is no Kotlin equivalent;
a rule that wants a parameter as a taint source names the first one and says so.

**A property assignment is a flat run of suffixes.** `v.settings.javaScriptEnabled = true`
is one `directly_assignable_expression` holding three parts rather than a
nesting, so a hole cannot stand for `v.settings`:

```
$S.javaScriptEnabled = true            does not match it
$V.settings.javaScriptEnabled = true   does
```

Write the chain out, and write the `$S.x = true` spelling beside it for the
`val settings = view.settings` case. The Java-style setter -
`$S.setJavaScriptEnabled(true)` - is an ordinary call and has neither problem.

### The two fixes, and why no Kotlin rule worked without them

Both are in xen0bit/pwrq#55 and both are the same shape as the C# ones: the
grammar says less than the others, and the engine was reading what was said
rather than measuring what was there.

**Modifiers go into a node of their own, at the head of the declaration.** A
pattern that writes none of them anchors its first child past that node, and
the two ways it fails are a miss and a wrong answer:

```
val $N = $V             missed `private val secret = "hunter2"`, silently
fun $F($$$_) { $BODY }  matched `private fun f(...)` with $F bound to "private"
```

The second is worse. The rule ran, reported the right line, and every guard on
the function's name was asked about a keyword. Real Kotlin writes almost
nothing without a `private`, an `internal`, an `override`, a `suspend`, a
`const` or an annotation, so between them the two covered most of the language:
`kotlin-credential-is-a-literal` is the rule that could not be written at all,
and it is the one every hardcoded-credential rule in every corpus is about.

The wrong-answer half is worth one more example, because it is the one that
will catch you. Both of this corpus's TLS rules are built on
`fun $F($$$_) { $BODY }` with a guard on `$F`, and every implementation of
either interface is written `override fun`:

```kotlin
override fun checkServerTrusted(chain: Array<X509Certificate>, authType: String) {}
override fun verify(hostname: String, session: SSLSession): Boolean { return true }
```

The pattern matched all along. `$F` bound to `"override"`, the guard asked
whether a keyword was called `checkServerTrusted`, and the rules reported
nothing on any input. They compiled, they ran, and they were silent.

An optional node in front fixes both. Which node it is is measured - a
declaration parsed bare, with one modifier and with two, and the answer is a
grammar that gave the same construct one extra child both times, which C and C#
do not because they write each modifier as a node of its own.

**Nothing in a binding has a field name, so nothing carried any flow.**

```
property_declaration  "val name = intent.getStringExtra(\"n\")"
  binding_pattern_kind      "val"
  variable_declaration      "name"
  call_expression           "intent.getStringExtra(\"n\")"
```

None of `left`/`right`, `name`/`value`, `declarator`/`value` matches that, and
the same is true of `assignment` and of `for`. `reaching` returned nothing for
every Kotlin file, in the language whose entire security literature is "an
intent's extra reaches a sink".

What makes it readable is that a grammar with no fields still marks the target
by wrapping it: `variable_declaration` and `directly_assignable_expression`
exist for nothing else, and an expression's operand is never wrapped that way.
The wrapper is measured from a probe, and the child *after* it is the value -
"the next one" rather than "the last one", which is what makes a `for` read
correctly, since the body is the child after that.

The same absence left the taint unscoped and unbounded, because `scopeOf` and
the closure boundary both ask for a `body` field. A grammar with no fields
names the parameter list instead, and the plural is the whole of the tell:
`function_value_parameters` and `lambda_parameters` are lists, `parameter` is
one item. The body is then the last child, because a lambda's is `statements`
and a function's is `function_body` and they have nothing in common but their
position.

**A lambda written without parameters is still not a boundary.** `Thread { ... }`
and every Android listener are that shape, so a value read inside one still
escapes it. It is the gap a Ruby block has, and the direction it errs in is
noise rather than a lost finding - but a rule that reports something built from
a listener rather than from an intent is a rule whose sources are too wide.

### What reading real Kotlin changed

Six repositories, about twenty-five hundred files: OkHttp, now-in-android,
Tivi, LeakCanary, the Kotlin website and InsecureShop, which is a deliberately
vulnerable Android app and the only one with anything to find. The first run
reported eighty-four findings and four causes were worth fixing.

- **The flags of a PendingIntent are a named constant.** Every false positive
  there was - four, across LeakCanary and Tivi - was
  `val flags = FLAG_UPDATE_CURRENT or FLAG_IMMUTABLE` a line above the call, or
  `private const val PENDING_INTENT_FLAGS = ...` at the top of the file. The
  argument the rule reads is a name and the decision is somewhere else, so the
  rule now asks only where the flags are written out at the call.
- **A method name without its arity is a different method.** okio spells a
  checksum `ByteString.md5()` with no arguments, and Apache spells a digest
  `DigestUtils.md5(x)` with one. A pattern that named the method reported
  OkHttp's own cache key, its certificate pin and the WebSocket accept key -
  three real uses of a weak hash, none of them a weakness. This is the same
  lesson `$C.Do($REQ)` taught in Go and it will keep coming back.
- **A regular expression is not a credential.** OkHttp's media-type parser
  holds ``private const val TOKEN = "([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)"``, which
  is a credential-shaped name over a pattern. That is the fifth kind of
  false positive this family of rules has now found in four languages, after
  the keyword table, the environment variable's name, the property's name and
  the placeholder.
- **One source is three spellings.** InsecureShop writes the same deep link as
  `intent.dataString`, `intent.data?.getQueryParameter("url")` and
  `intent.extras?.getString("url")`, in one file, three lines apart. A rule
  that knew only the first found one of the three - and the second two need a
  guard on the receiver, because `resources.getString` is every string in
  every app.

Eighty-four became seventy-three, and the shape of what is left is the answer:
now-in-android and the Kotlin website report nothing at all, Tivi reports
nothing, LeakCanary reports eight and every one is a loopback socket or a
checksum, and InsecureShop - the app with the bugs in it - went from seven
findings to eleven, all true. OkHttp holds the rest, and every cleartext-URL
finding in it is in a test directory or in the documented samples: an HTTP
library's test suite is about HTTP and dials cleartext on purpose. A rule about
addresses will always say most about the library whose subject is addresses.

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
  password), `${db.password}` (a placeholder, which is the fix), the word
  `"password"` itself, or a constant whose value is the name of somewhere the
  value lives — `"APP_DB_PASSWORD"`, `"spring.datasource.password"`,
  `"Access-Control-Allow-Credentials"`. It does report `"changeit"`, which is
  the default password of every Java keystore and is the point.
- `kotlin-accepts-any-hostname` leaves alone any verifier that compares the
  host to anything at all, right or wrong. `host == "api.example.com"` is
  pinning and `defaultVerifier.verify(...)` is delegation, and a rule that
  cannot tell a good comparison from a bad one has no business reporting
  either. What it can tell is the absence of one.
- `kotlin-webview-javascript-interface` does not report a bridge in a method
  that names `file:///android_asset/`, because that is a WebView showing HTML
  the app shipped and is the case the API is for. That test is the method's own
  text, so a method that loads an asset *and* a remote page goes unreported
  too — coarse, and coarse in the quiet direction.
- `kotlin-mutable-pending-intent` reports `FLAG_MUTABLE` even though it is
  deliberate. There are real uses for it and nothing in the syntax says which
  this is, and a token somebody else can aim is worse than a finding somebody
  has to read.

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

The second Java pass — the one that taught the matcher a declaration's other
two names — added a rule that reads a constant field, and running *that* over
the same six repositories found two more of the same kind in an afternoon.
Guava's `ACCESS_CONTROL_ALLOW_CREDENTIALS = "Access-Control-Allow-Credentials"`
is a credential-shaped name holding a header's name; and
`"password".toCharArray()` slipped past an exclusion anchored to the end of the
literal, because the placeholder had a method call after it. Both are the same
lesson as the rest: **an exclusion has to be written against the text the
capture actually holds**, and the only way to find out what that is, is to run
it over somebody else's code.

Two hundred and fifty-six became fifty-four, spring-petclinic — a clean
application — reported nothing at all, and the single finding in the whole of
spring-framework's main source was the one Spring's own authors had annotated
with a comment explaining why they accepted it. None of the six was visible
from inside a fixture.

Also read the counts. A rule reporting a hundred findings in one file is
telling you something about itself, and one reporting a thousand across a
module is telling you it has matched a name rather than a thing.

The C# pass is the third data point and the ratio was the worst yet: **fifty-one
findings over two hundred and fifty files, of which forty-five were wrong**.
Three sources, all invisible from inside a fixture.

**A parameter source needs to know it is in a web application.** The rule said
"a value that arrives as a parameter of a public method is untrusted", which is
true of a controller action and true of nothing else. Over ShareX — a desktop
screenshot tool — the path-traversal rule reported **twenty-seven** findings,
every one a `string filePath` parameter of a file helper. The fix is a file
level guard, and the measurement that it is the right one: over two hundred and
fifty real ASP.NET files the guard keeps 179 of 216 parameter sources, and over
ShareX it removes all 27.

```
| ($all | of($bound) | focus("P")
   | in_files_with( ($all | of($mvcImports))
                    + ($all | of($classes) | where_capture("B"; "Controller")) ))
```

**A name that names the thing is not the thing.** The credential rule fired on
fourteen literals and one was a credential. `ConnectionString` as a *field name*
is not a secret — `"Data Source=test.db"` has nothing in it — so the connection
string is caught by reading its value for a `Password=` instead. A `"Password"`
literal beside `"Mode"` and `"Cache"` is a keyword table. `"oauth_token"` is a
protocol parameter. `"https://oauth2.googleapis.com/token"` is an endpoint. The
shape that separates all four from `hunter2` is that they are letters and
separators with a credential word inside them, and a password with digits in it
is not.

**A rule can be right about a construct and wrong about a type.** The zip rule
read `.FullName`, which `ZipArchiveEntry` has and so do `FileInfo` and
`DirectoryInfo` — where it is a resolved absolute path rather than an
attacker's string. `Path.Combine(target.FullName, fi.Name)` in a recursive
directory copy was reported. Narrowing the source to a receiver *named* like an
entry, in a file that imports an archive library at all, is the cheap fix.

And one that is worth knowing because the rule was *right* and still had to be
quietened: ShareX's `ZipManager` does the correct root check —
`Path.GetFullPath` then `StartsWith` — which a value-following rule cannot see,
because it is a comparison rather than a call. A method that does both is now
left alone. That is coarse, and quiet is the right direction to be coarse in.

After all three, fifty-one findings became six, and all six are the weak-hash
rule reporting real MD5 and SHA-1 — a checksum tool offering both to the user,
and two APIs whose protocols require them. That rule's header says the
judgement is the reader's, which is the honest place for it to land.

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

Six in Kotlin, and every one of them the same cause: the rule was written
around an assignment. `$VAR = $MD.getInstance("MD5")`,
`$KEY = $G.getInstance("RSA")`, `$DCTX = InitialDirContext($ENV, ...)` — Kotlin
introduces a value with `val` or `var`, which is a *declaration* and a
different node, so the assignment reading matched nothing any Kotlin program
has ever contained. `use-of-sha1`, `weak-rsa` and `anonymous-ldap-bind` were
dead outright and `use-of-md5` found only its Apache alternative. The fix for
most of them was to stop naming the binding at all: `$MD.getInstance($ALGO)` is
the call wherever it stands, in a declaration or an assignment or on its own,
and where a rule names a binding it should be because the binding is part of
the question. Two more failed for reasons of their own —
`build-gradle-password-hardcoded` searched `*.kt` and a Gradle Kotlin script is
`build.gradle.kts`, and `bad-hexa-conversion` assumed the digest and the
rendering were statements in one function, which they never are.

That is the failure a rule cannot be read for, and a fixture is the only thing
that finds it. If you are adding a rule beside an existing one that has no
fixture, spend five minutes pointing the old one at code it should fire on
before you assume the gap in coverage is where you think it is. In PHP that
five minutes would have saved a corpus.
