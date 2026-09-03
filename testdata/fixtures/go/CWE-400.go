package fixture

// CWE-400: a server with no timeouts is held open for as long as a client
// likes.
//
// net/http applies no deadline of its own. A connection that sends one byte
// of a request header and then nothing occupies a goroutine and a file
// descriptor for ever, and a few thousand of those - which is one cheap
// script - is the whole server. That is Slowloris, and it is a configuration
// line rather than a bug in the handler.
//
// http.ListenAndServe is reported wherever it appears, because it builds a
// server whose timeout fields cannot be reached: there is no argument for
// them and no value returned to set them on. Writing out the http.Server is
// the fix as well as the place the fix goes.

import (
	"net/http"
	"time"
)

func servesWithNoTimeouts(h http.Handler) error {
	// ruleid: go-server-without-timeouts
	return http.ListenAndServe(":8080", h)
}

func servesTLSWithNoTimeouts(h http.Handler) error {
	// ruleid: go-server-without-timeouts
	return http.ListenAndServeTLS(":8443", "cert.pem", "key.pem", h)
}

func buildsAServerWithoutTimeouts(h http.Handler) *http.Server {
	// ruleid: go-server-without-timeouts
	return &http.Server{
		Addr:    ":8080",
		Handler: h,
	}
}

// A write deadline does not stop a client that never finishes sending its
// headers, which is the half Slowloris uses.
func setsOnlyAWriteTimeout(h http.Handler) *http.Server {
	// ruleid: go-server-without-timeouts
	return &http.Server{
		Addr:         ":8080",
		Handler:      h,
		WriteTimeout: 10 * time.Second,
	}
}

// A deadline on the whole request, which covers the headers.
func setsAReadTimeout(h http.Handler) *http.Server {
	// ok: go-server-without-timeouts
	return &http.Server{
		Addr:         ":8080",
		Handler:      h,
		ReadTimeout:  5 * time.Second,
		WriteTimeout: 10 * time.Second,
	}
}

// The narrower deadline that answers Slowloris exactly.
func setsAReadHeaderTimeout(h http.Handler) *http.Server {
	// ok: go-server-without-timeouts
	return &http.Server{
		Addr:              ":8080",
		Handler:           h,
		ReadHeaderTimeout: 3 * time.Second,
	}
}
