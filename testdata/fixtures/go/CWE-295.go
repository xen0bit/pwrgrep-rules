package fixture

import (
	"crypto/tls"
	"net/http"
)

func permissive() *http.Transport {
	// ruleid: go-tls-insecure
	return &http.Transport{TLSClientConfig: &tls.Config{InsecureSkipVerify: true}}
}

func permissiveAmongOthers() *tls.Config {
	// ruleid: go-tls-insecure
	return &tls.Config{MinVersion: tls.VersionTLS12, InsecureSkipVerify: true}
}

func permissiveLater() *tls.Config {
	cfg := &tls.Config{MinVersion: tls.VersionTLS13}
	// ruleid: go-tls-insecure
	cfg.InsecureSkipVerify = true
	return cfg
}

func anotherPermissive() *tls.Config {
	// ruleid: go-tls-insecure
	return &tls.Config{InsecureSkipVerify: true, MinVersion: tls.VersionTLS12}
}

// ok: go-tls-insecure
func configurable(skip bool) *tls.Config {
	return &tls.Config{InsecureSkipVerify: skip}
}

// ok: go-tls-insecure
func strict() *tls.Config {
	return &tls.Config{MinVersion: tls.VersionTLS13}
}

// ok: go-tls-insecure
func noTLS() *tls.Config {
	return &tls.Config{MinVersion: tls.VersionTLS12}
}
