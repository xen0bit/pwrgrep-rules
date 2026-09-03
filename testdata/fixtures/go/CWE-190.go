package fixture

// CWE-190: an integer conversion that narrows or changes sign wraps silently.
//
// Go does not range check a conversion. int32(x) of an int that does not fit
// keeps the low bits, and uint32(x) of a negative int is a very large number.
// Where the value came from outside the program - a request parameter parsed
// with strconv, a length sent by a peer - the wrapped result is chosen by
// whoever sent it, and it is almost always used next as a size or an index.

import (
	"net/http"
	"strconv"
)

func overflowAge(r *http.Request) int32 {
	n, err := strconv.Atoi(r.FormValue("age"))
	if err != nil {
		return 0
	}
	// ruleid: go-integer-overflow-conversion
	return int32(n)
}

func overflowSize(r *http.Request) []byte {
	size, err := strconv.ParseInt(r.FormValue("size"), 10, 64)
	if err != nil {
		return nil
	}
	// ruleid: go-integer-overflow-conversion
	return make([]byte, uint32(size))
}

func overflowPort(raw string) uint16 {
	p, _ := strconv.Atoi(raw)
	// ruleid: go-integer-overflow-conversion
	return uint16(p)
}

// A negative int becomes an enormous uint, which is the same bug wearing the
// other hat: the check that the number was not negative is the one missing.
func overflowUnsigned(raw string) uint {
	n, _ := strconv.Atoi(raw)
	// ruleid: go-integer-overflow-conversion
	return uint(n)
}

// Bounded before the conversion, so the conversion cannot wrap.
func checkedAge(raw string) int32 {
	n, err := strconv.Atoi(raw)
	if err != nil || n < 0 || n > 1000 {
		return 0
	}
	// ok: go-integer-overflow-conversion
	return int32(n)
}

// strconv was told the width it had to fit, so the value already fits.
func parsedAtWidth(raw string) int32 {
	n, err := strconv.ParseInt(raw, 10, 32)
	if err != nil {
		return 0
	}
	// ok: go-integer-overflow-conversion
	return int32(n)
}

// Nothing from outside reached this one.
func constantWidth() int32 {
	n := 42
	// ok: go-integer-overflow-conversion
	return int32(n)
}

// Widening cannot lose anything.
func widened(raw string) int64 {
	n, _ := strconv.Atoi(raw)
	// ok: go-integer-overflow-conversion
	return int64(n)
}
