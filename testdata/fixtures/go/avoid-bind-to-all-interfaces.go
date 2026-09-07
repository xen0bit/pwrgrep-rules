package fixture

import (
	"crypto/tls"
	"net"
)

func vulnAll() (net.Listener, error) {
	// ruleid: avoid-bind-to-all-interfaces
	return net.Listen("tcp", "0.0.0.0:8080")
}

func vulnEmpty() (net.Listener, error) {
	// ruleid: avoid-bind-to-all-interfaces
	return net.Listen("tcp", ":8080")
}

func vulnTLSAll(config *tls.Config) (net.Listener, error) {
	// ruleid: avoid-bind-to-all-interfaces
	return tls.Listen("tcp", "0.0.0.0:8443", config)
}

func safeLoopback() (net.Listener, error) {
	// ok: avoid-bind-to-all-interfaces
	return net.Listen("tcp", "127.0.0.1:8080")
}

func safeHost() (net.Listener, error) {
	// ok: avoid-bind-to-all-interfaces
	return net.Listen("tcp", "localhost:8080")
}

func safeTLSLoopback(config *tls.Config) (net.Listener, error) {
	// ok: avoid-bind-to-all-interfaces
	return tls.Listen("tcp", "127.0.0.1:8443", config)
}
