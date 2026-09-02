// Package pwrgreprules is the pwrq structural rule corpus, and nothing else.
//
// It holds no code that reads a rule. A rule is a pwrq query - a text file
// with a header naming the ids it reports under - so the corpus is data, and
// the engine that compiles and runs it lives in pwrq's pkg/pwrgrep. Keeping
// the two apart is what lets the rules be revised, reviewed and released on
// their own cadence without a pwrq release behind each change.
//
// It is a Go module rather than a git submodule because the corpus is embedded
// into the pwrq binary, and a submodule's contents are not in the zip the
// module proxy serves: `go install pwrq@latest` would fetch a tree with an
// empty rules directory and fail at the embed. As a dependency it is fetched
// like any other, pinned in go.sum, and every build path - go install, a fresh
// clone, goreleaser - gets the same corpus.
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
