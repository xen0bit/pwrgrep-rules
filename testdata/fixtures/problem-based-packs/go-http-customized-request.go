// CWE-319: http.NewRequest cleartext
package fixture

import "net/http"

func vuln() {
	// ruleid: http-customized-request
	http.NewRequest("GET", "http://example.com", nil)
	// ruleid: http-customized-request
	http.NewRequest("POST", "http://example.com", nil)
}

func vuln2() {
	// ruleid: http-customized-request
	http.NewRequest("PUT", "http://example.com/api", nil)
	// ruleid: http-customized-request
	http.NewRequest("DELETE", "http://example.com/resource", nil)
}

func safe() {
	// ok: http-customized-request
	http.NewRequest("GET", "https://example.com", nil)
	// ok: http-customized-request
	http.NewRequest("GET", "http://localhost", nil)
}

func safe2() {
	// ok: http-customized-request
	http.NewRequest("GET", "http://127.0.0.1/resource", nil)
}
