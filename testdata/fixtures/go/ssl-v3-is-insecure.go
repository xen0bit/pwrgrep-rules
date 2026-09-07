package fixture

import (
	"crypto/tls"
)

func vulnSSL30() *tls.Config {
	// ruleid: ssl-v3-is-insecure
	return &tls.Config{MinVersion: tls.VersionSSL30}
}

func vulnSSL30Again() *tls.Config {
	// ruleid: ssl-v3-is-insecure
	return &tls.Config{MinVersion: tls.VersionSSL30}
}

func vulnSSL30Max() *tls.Config {
	// ruleid: ssl-v3-is-insecure
	return &tls.Config{MinVersion: tls.VersionSSL30, MaxVersion: tls.VersionTLS12}
}

func safeTLS12() *tls.Config {
	// ok: ssl-v3-is-insecure
	return &tls.Config{MinVersion: tls.VersionTLS12}
}

func safeTLS13() *tls.Config {
	// ok: ssl-v3-is-insecure
	return &tls.Config{MinVersion: tls.VersionTLS13}
}

func safeNoVersion() *tls.Config {
	// ok: ssl-v3-is-insecure
	return &tls.Config{InsecureSkipVerify: false}
}
