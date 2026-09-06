// CWE-338: math/rand where the value is meant to be unguessable.
//
// Most of the draws here are correct - a jitter, a shuffle, a pick from a
// pool. What separates the findings is the name the result is given.
package fixture

import (
	crand "crypto/rand"
	mrand "math/rand"
)

func issueSession() int {
	// ruleid: go-insecure-random
	sessionToken := mrand.Int63()
	return int(sessionToken)
}

func issueNonce() uint32 {
	// ruleid: go-insecure-random
	nonce := mrand.Uint32()
	return nonce
}

func fixTheSequence() {
	// ruleid: go-insecure-random
	mrand.Seed(42)
}

func issueSessionProperly() ([]byte, error) {
	sessionToken := make([]byte, 32)
	// ok: go-insecure-random
	_, err := crand.Read(sessionToken)
	return sessionToken, err
}

func ordinaryUses(pool []string) (float64, string) {
	// ok: go-insecure-random
	backoff := mrand.Float64()
	// ok: go-insecure-random
	pick := pool[mrand.Intn(len(pool))]
	return backoff, pick
}

func notRandom() int {
	// ok: go-insecure-random
	return 42
}
