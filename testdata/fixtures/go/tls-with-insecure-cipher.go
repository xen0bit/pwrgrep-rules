package fixture

import (
	"crypto/tls"
)

func vulnRC4() *tls.Config {
	// ruleid: tls-with-insecure-cipher
	return &tls.Config{CipherSuites: []uint16{tls.TLS_RSA_WITH_RC4_128_SHA}}
}

func vuln3DES() *tls.Config {
	// ruleid: tls-with-insecure-cipher
	return &tls.Config{CipherSuites: []uint16{tls.TLS_RSA_WITH_3DES_EDE_CBC_SHA}}
}

func vulnCBC() *tls.Config {
	// ruleid: tls-with-insecure-cipher
	return &tls.Config{CipherSuites: []uint16{tls.TLS_RSA_WITH_AES_128_CBC_SHA256}}
}

func safeGCM() *tls.Config {
	// ok: tls-with-insecure-cipher
	return &tls.Config{CipherSuites: []uint16{tls.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256}}
}

func safeGCMOnly() *tls.Config {
	// ok: tls-with-insecure-cipher
	return &tls.Config{CipherSuites: []uint16{tls.TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384}}
}

func safeNoSuites() *tls.Config {
	// ok: tls-with-insecure-cipher
	return &tls.Config{MinVersion: tls.VersionTLS12}
}
