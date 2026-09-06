package fixture

// CWE-502: Deserialization of Untrusted Data via gob
import (
	"bytes"
	"encoding/gob"
	"net/http"
)

func vuln1(r *http.Request) {
	// ruleid: go-deserialization
	gob.NewDecoder(r.Body).Decode(&struct{}{})
}

func vuln2(r *http.Request) {
	// ruleid: go-deserialization
	gob.NewDecoder(r.Body).Decode(&struct{}{})
}

func safe1() {
	// ok: go-deserialization
	gob.NewDecoder(bytes.NewBufferString("fixed")).Decode(&struct{}{})
}

func safe2() {
	// ok: go-deserialization
	gob.NewDecoder(bytes.NewBufferString("hello")).Decode(&struct{}{})
}
func vuln3(r *http.Request) {
    // ruleid: go-deserialization
    gob.NewDecoder(r.Body).Decode(&struct{}{})
}

func vuln4(r *http.Request) {
    q := r.URL.Query().Get("data")
    // ruleid: go-deserialization
    gob.NewDecoder(bytes.NewBufferString(q)).Decode(&struct{}{})
}

func safe3() {
    // ok: go-deserialization
    gob.NewDecoder(bytes.NewReader([]byte("fixed"))).Decode(&struct{}{})
}
