package fixture

// CWE-252: the error from a random read is thrown away.
//
// crypto/rand.Read fills a buffer and returns how much it filled. If it
// fails - and it can, on a machine whose entropy source is not ready or whose
// file descriptors have run out - the buffer keeps whatever it had, which for
// a freshly made slice is zeros. A key, a token or an IV made this way is a
// constant, and nothing about the program says so afterwards: it runs, it
// encrypts, and every value it produces is the same one.
//
// Go will not let the return be ignored silently, so the two spellings that
// throw it away are the two this reports: a bare call, and an assignment to
// the blank identifier.

import (
	"crypto/rand"
	"io"
)

func tokenFromIgnoredRead() []byte {
	b := make([]byte, 32)
	// ruleid: go-unchecked-random-read
	rand.Read(b)
	return b
}

func keyFromDiscardedError() []byte {
	key := make([]byte, 32)
	// ruleid: go-unchecked-random-read
	_, _ = rand.Read(key)
	return key
}

func ivFromDiscardedFullRead() []byte {
	iv := make([]byte, 16)
	// ruleid: go-unchecked-random-read
	_, _ = io.ReadFull(rand.Reader, iv)
	return iv
}

// The error is checked, which is the whole difference.
func checkedToken() ([]byte, error) {
	b := make([]byte, 32)
	// ok: go-unchecked-random-read
	if _, err := rand.Read(b); err != nil {
		return nil, err
	}
	return b, nil
}

// Assigned and returned, so the caller decides.
func returnedError() ([]byte, error) {
	b := make([]byte, 32)
	// ok: go-unchecked-random-read
	n, err := rand.Read(b)
	_ = n
	return b, err
}

// Handed straight back to the caller.
func passesItOn(b []byte) (int, error) {
	// ok: go-unchecked-random-read
	return rand.Read(b)
}
