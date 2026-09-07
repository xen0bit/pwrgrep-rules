package fixture

import (
	"crypto/tls"
)

func vulnEmpty() *tls.Config {
	// ruleid: missing-ssl-minversion
	return &tls.Config{}
}

func vulnSkipVerify() *tls.Config {
	// ruleid: missing-ssl-minversion
	return &tls.Config{InsecureSkipVerify: true}
}

func vulnCiphersOnly() *tls.Config {
	// ruleid: missing-ssl-minversion
	return &tls.Config{CipherSuites: []uint16{tls.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256}}
}

func safePinned() *tls.Config {
	// ok: missing-ssl-minversion
	return &tls.Config{MinVersion: tls.VersionTLS12}
}

func safePinnedFull() *tls.Config {
	// ok: missing-ssl-minversion
	return &tls.Config{MinVersion: tls.VersionTLS13, CipherSuites: []uint16{tls.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256}}
}

func safePinnedOld() *tls.Config {
	// ok: missing-ssl-minversion
	return &tls.Config{MinVersion: tls.VersionTLS10}
}
