package fixture

// CWE-208: a secret compared with == leaks how much of it was right.
//
// Go's string and []byte equality stops at the first byte that differs, so
// the comparison takes longer the longer the common prefix is. Against an
// attacker who can time it and retry, that turns guessing a 32-byte MAC from
// 2^256 work into 256 * 32, one byte at a time. crypto/subtle exists for
// exactly this: ConstantTimeCompare and hmac.Equal look at every byte
// whatever they find.
//
// The rule reads the names, because a comparison does not say what it is
// comparing and the name is the only thing here that does.

import (
	"crypto/hmac"
	"crypto/subtle"
	"net/http"
)

func checksMACWithEquality(gotMAC, wantMAC string) bool {
	// ruleid: go-secret-compared-in-variable-time
	return gotMAC == wantMAC
}

func rejectsBadSignature(w http.ResponseWriter, r *http.Request, expected string) {
	signature := r.Header.Get("X-Signature")
	// ruleid: go-secret-compared-in-variable-time
	if signature != expected {
		w.WriteHeader(http.StatusForbidden)
		return
	}
}

func checksAPIKey(r *http.Request, storedKey string) bool {
	apiKey := r.Header.Get("X-Api-Key")
	// ruleid: go-secret-compared-in-variable-time
	return apiKey == storedKey
}

func checksSessionToken(given, stored string) bool {
	// ruleid: go-secret-compared-in-variable-time
	return given == stored || given == "" || sessionToken(given) == stored
}

// The whole point of subtle: every byte is looked at whatever it holds. The
// names here carry the same signal the reported lines do, so this is the case
// that says the rule reads the comparison and not only the names.
func checksMACInConstantTime(gotMAC, wantMAC []byte) bool {
	// ok: go-secret-compared-in-variable-time
	return subtle.ConstantTimeCompare(gotMAC, wantMAC) == 1
}

// hmac.Equal is ConstantTimeCompare wearing a name that says what it is for.
func checksHMAC(gotMAC, wantMAC []byte) bool {
	// ok: go-secret-compared-in-variable-time
	return hmac.Equal(gotMAC, wantMAC)
}

// Asking whether a secret was supplied at all is not comparing it to
// anything, and there is no prefix to learn from an empty string.
func requiresAToken(token string) bool {
	// ok: go-secret-compared-in-variable-time
	if token == "" {
		return false
	}
	return true
}

// Not a secret, and nothing to guess a byte at a time.
func routesByName(name string) bool {
	// ok: go-secret-compared-in-variable-time
	return name == "index"
}

func sessionToken(s string) string { return s }
