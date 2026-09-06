// CWE-319: gorequest cleartext HTTP
package fixture

import "github.com/parnurzeal/gorequest"

func vuln() {
	// ruleid: gorequest-http-request
	gorequest.New().Get("http://example.com")
	// ruleid: gorequest-http-request
	gorequest.New().Post("http://example.com")
}

func vuln2() {
	// ruleid: gorequest-http-request
	gorequest.New().Put("http://example.com")
	// ruleid: gorequest-http-request
	gorequest.New().Delete("http://example.com")
}

func safe() {
	// ok: gorequest-http-request
	gorequest.New().Get("https://example.com")
	// ok: gorequest-http-request
	gorequest.New().Get("http://localhost")
}

func safe2() {
	// ok: gorequest-http-request
	gorequest.New().Get("http://127.0.0.1")
}
