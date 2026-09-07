// CWE-319: cleartext HTTP via grequests. http:// URLs flag; https and
// other clients stay quiet.
package fixture

import (
	"github.com/levigross/grequests"
	"net/http"
)

func vuln() {
	// ruleid: grequests-http-request
	resp, _ := grequests.Get("http://example.com", nil)
	_ = resp
	// ruleid: grequests-http-request
	resp2, _ := grequests.Post("http://example.com/api", nil)
	_ = resp2

	// ok: grequests-http-request
	resp3, _ := grequests.Get("https://example.com", nil)
	_ = resp3
	// ok: grequests-http-request
	http.Get("https://example.com")
}
