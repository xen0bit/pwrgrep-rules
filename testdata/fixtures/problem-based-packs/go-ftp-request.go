// CWE-319: cleartext FTP via jlaffaye/ftp - the package only speaks FTP,
// so every dial is a finding. Other transports stay quiet.
package fixture

import (
	ftp "github.com/jlaffaye/ftp"
	"net/http"
)

func vuln() {
	// ruleid: ftp-request
	c, _ := ftp.Connect("ftp.example.com:21")
	_ = c
	// ruleid: ftp-request
	d, _ := ftp.Dial("ftp.example.com:21")
	_ = d
	// ruleid: ftp-request
	e, _ := ftp.DialTimeout("ftp.example.com:21", 5)
	_ = e

	// ok: ftp-request
	http.Get("https://example.com")
	// ok: ftp-request
	http.Get("http://localhost")
}
