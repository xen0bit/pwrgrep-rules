// CWE-326: Inadequate Encryption Strength — old TLS versions
// Old TLS versions (TLS 1.0, 1.1, SSL 3.0) have known weaknesses.
package fixture
import "crypto/tls"
func vuln1(){
	// ruleid: disallow-old-tls-versions
	cfg1 := tls.Config{CipherSuites: nil, MinVersion: tls.VersionTLS10, MaxVersion: tls.VersionTLS13}
	// ruleid: disallow-old-tls-versions
	cfg2 := tls.Config{CipherSuites: nil, MinVersion: tls.VersionTLS11, MaxVersion: tls.VersionTLS13}
	// ruleid: disallow-old-tls-versions
	cfg3 := tls.Config{CipherSuites: nil, MinVersion: tls.VersionSSL30, MaxVersion: tls.VersionTLS13}
	// ruleid: disallow-old-tls-versions
	cfg4 := tls.Config{CipherSuites: nil, MinVersion: tls.VersionTLS10, MaxVersion: tls.VersionTLS12}
}
func safe(){
	// ok: disallow-old-tls-versions
	cfg1 := tls.Config{CipherSuites: nil, MinVersion: tls.VersionTLS12, MaxVersion: tls.VersionTLS13}
	_ = cfg1
	// ok: disallow-old-tls-versions
	cfg2 := tls.Config{MinVersion: tls.VersionTLS13}
	_ = cfg2
	// ok: disallow-old-tls-versions
	cfg3 := tls.Config{CipherSuites: nil, MinVersion: tls.VersionTLS12}
	_ = cfg3
}
