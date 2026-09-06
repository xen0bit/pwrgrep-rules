// CWE-611: XML External Entity via encoding/xml
//
// encoding/xml with user input can resolve external entities when the
// document is attacker-controlled, leading to file disclosure or SSRF.

package fixture

import (
	"encoding/xml"
	"net/http"
)

func vuln1(r *http.Request) {
	data := r.URL.Query().Get("xml")
	var v interface{}
	// ruleid: go-xxe
	xml.Unmarshal([]byte(data), &v)
}

func vuln2(r *http.Request) {
	input := r.FormValue("data")
	// ruleid: go-xxe
	xml.Unmarshal([]byte(input), &struct{}{})
}

func vuln3(r *http.Request) {
	x := r.PostFormValue("payload")
	var v interface{}
	// ruleid: go-xxe
	xml.Unmarshal([]byte(x), &v)
}

func safe() {
	// ok: go-xxe
	var v interface{}
	xml.Unmarshal([]byte("<root>hello</root>"), &v)
	// ok: go-xxe
	xml.Unmarshal([]byte("<root/>"), &struct{}{})
	// ok: go-xxe
	xml.NewDecoder(nil).Decode(nil)
}
