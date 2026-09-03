package fixture

// CWE-798: a credential written into the source.
//
// A password in a Go file is in every binary built from it - strings(1) finds
// it in seconds - in every core dump, and in this repository's history for
// good, where deleting the line does not remove it. It is the same secret for
// every deployment, and changing it needs a release.
//
// The rule reads the name and then the value: a name that says credential
// with a string literal beside it. A placeholder is not a credential, so the
// obvious ones are subtracted rather than reported, because a rule that fires
// on "changeme" teaches people to skip it.

import "net/http"

// ruleid: go-hardcoded-credential
const apiKey = "sk_live_9f2b7c41e8a34d5f9012"

type config struct {
	Endpoint string
	Password string
}

func connectString() string {
	// ruleid: go-hardcoded-credential
	password := "hunter2-correct-horse-battery"
	return password
}

func staticConfig() config {
	// ruleid: go-hardcoded-credential
	return config{Password: "p4ssw0rd-in-the-source-tree"}
}

// A literal with more than one field is not reached: the pattern's match is
// the literal, the matcher gives one match per node, and so only the first
// field is ever bound. Left here unannotated because it is a real miss and
// saying "ok" about it would be a claim the rule does not make.
func multiFieldConfig() config {
	return config{
		Endpoint: "https://api.example.com",
		Password: "p4ssw0rd-in-the-source-tree",
	}
}

func authHeader(r *http.Request) {
	// ruleid: go-hardcoded-credential
	var authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6"
	r.Header.Set("Authorization", authToken)
}

// A name that says credential and a value that says "fill this in" is a
// placeholder, and reporting it is how a rule teaches people to skip it.
func placeholder() string {
	// ok: go-hardcoded-credential
	password := "changeme"
	return password
}

// Read at run time from wherever the deployment keeps it.
func fromTheEnvironment() string {
	// ok: go-hardcoded-credential
	password := envOr("APP_PASSWORD", "")
	return password
}

// Not a credential, however long the string is.
func endpoint() string {
	// ok: go-hardcoded-credential
	endpointURL := "https://api.example.com/v1/things"
	return endpointURL
}

func envOr(k, d string) string { _ = k; return d }
