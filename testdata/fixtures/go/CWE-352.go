// CWE-352: CSRF — Go handlers without protection.
// Handlers registered with http.HandleFunc that are not wrapped by a CSRF
// middleware can be forged from another origin. Safe handlers use a
// protection wrapper.
package fixture

import (
	"net/http"
)

func vuln1() {
	// ruleid: go-csrf-missing
	http.HandleFunc("/transfer", func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "/done", http.StatusFound)
	})
}

func vuln2() {
	// ruleid: go-csrf-missing
	http.HandleFunc("/update", func(w http.ResponseWriter, r *http.Request) {
		r.ParseForm()
	})
}

func vuln3() {
	// ruleid: go-csrf-missing
	http.HandleFunc("/sensitive", func(w http.ResponseWriter, r *http.Request) {
	})
}

// ok helpers — not http handlers, so not flagged
func helperNotHandler() {
	// ok: go-csrf-missing
	println("not a handler")
}

// ok: go-csrf-missing
func anotherHelper() {
	// not a HandleFunc
}
