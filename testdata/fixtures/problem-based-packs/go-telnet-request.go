// CWE-319: Cleartext Transmission of Sensitive Information
// telnet is cleartext and should not be used

package fixture

import (
	"github.com/reiver/go-telnet"
	"net"
	"golang.org/x/crypto/ssh"
)

func vulnTelnet1() {
	// ruleid: telnet-request
	_, _ = telnet.DialToAndCall("example.com:23")
	// ruleid: telnet-request
	_, _ = telnet.DialToAndCall("192.168.1.1:23")
	// ruleid: telnet-request
	_, _ = telnet.DialToAndCall("10.0.0.1:23")
	// ruleid: telnet-request
	_, _ = telnet.DialToAndCall("telnet.example.com:23")
}

func safeTelnet() {
	// ok: telnet-request
	_, _ = net.Dial("tcp", "example.com:22")
	// ok: telnet-request
	_, _ = ssh.Dial("tcp", "example.com:22", nil)
	// ok: telnet-request
	_, _ = net.DialTimeout("tcp", "secure.example.com:443", 0)
}
