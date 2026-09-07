package fixture

// ruleid: math-random-used
import "math/rand"

// ruleid: math-random-used
import r2 "math/rand"

// ruleid: math-random-used
import "math/rand/v2"

// ok: math-random-used
import crand "crypto/rand"

func roll() int {
	return rand.Intn(6) + r2.Intn(6)
}

func token() []byte {
	// ok: math-random-used
	buf := make([]byte, 16)
	_, _ = crand.Read(buf)
	return buf
}

func constant() int {
	// ok: math-random-used
	return 42
}
