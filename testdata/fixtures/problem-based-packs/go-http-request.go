// CWE-319: Cleartext HTTP request via net/http
package fixture

import "net/http"

func vuln() {
	// ruleid: http-request
	http.Get("http://example.com")
	// ruleid: http-request
	http.Post("http://example.com", "text", nil)
}

func vuln2() {
	// ruleid: http-request
	http.Head("http://example.com")
	// ruleid: http-request
	http.PostForm("http://example.com", nil)
}

func safe() {
	// ok: http-request
	http.Get("https://example.com")
	// ok: http-request
	http.Get("http://localhost")
}

func safe2() {
	// ok: http-request
	http.Get("http://127.0.0.1")
}
