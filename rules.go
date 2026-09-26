// Package pwrgreprules is a pwrq structural rule corpus for security review,
// and nothing else.
//
// It holds no code that reads a rule. A rule is a pwrq query - a text file
// with a header naming the ids it reports under - so the corpus is data, and
// the engine that compiles and runs it lives in pwrq's pkg/pwrgrep. pwrq does
// not embed it; a checkout is put on PWRQ_RULES. The embedded copies below are
// for a program that wants to carry the corpus inside its binary.
package pwrgreprules

import "embed"

// FS is the corpus, rooted at "rules". Paths under it are the rule's place in
// the catalogue - "go/lang/security/audit/crypto/go-weak-hash.pwrq" - which is
// also how a caller selects one.
//
//go:embed rules
var FS embed.FS

// Fixtures are the annotated files the rules carrying a `# fixture:` header
// are checked against, rooted at "testdata/fixtures". A header names a path relative to
// that root, so `# fixture: go/weak-hash.go` is "testdata/fixtures/go/weak-hash.go".
//
// They ship beside the rules rather than in whichever repository happens to
// run the test, because a rule and the file proving it fires are one thing: a
// rule that moves without its fixture arrives somewhere unverifiable. They are
// a few kilobytes in total, which is cheaper than the alternative of a second
// package nobody remembers to update.
//
//go:embed testdata/fixtures
var Fixtures embed.FS
