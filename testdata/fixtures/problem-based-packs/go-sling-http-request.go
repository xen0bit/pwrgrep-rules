// CWE-319: cleartext HTTP via sling. http:// URLs flag; https and other
// clients stay quiet.
package fixture

import (
	"github.com/dghubble/sling"
	"net/http"
)

func vuln() {
	// ruleid: sling-http-request
	req, _ := sling.New().Get("http://example.com").Request()
	_ = req
	s := sling.New()
	// ruleid: sling-http-request
	_ = s.Post("http://example.com/api")

	// ok: sling-http-request
	req2, _ := sling.New().Get("https://example.com").Request()
	_ = req2
	// ok: sling-http-request
	http.Get("https://example.com")
}
