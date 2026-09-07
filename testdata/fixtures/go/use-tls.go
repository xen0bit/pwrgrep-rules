package fixture

import (
	"net/http"
)

func vulnPlain(handler http.Handler) error {
	// ruleid: use-tls
	return http.ListenAndServe(":8080", handler)
}

func vulnPlainAgain(mux *http.ServeMux) error {
	// ruleid: use-tls
	return http.ListenAndServe(":9090", mux)
}

func vulnPlainThird() error {
	// ruleid: use-tls
	return http.ListenAndServe("0.0.0.0:8080", nil)
}

func safeTLS(handler http.Handler) error {
	// ok: use-tls
	return http.ListenAndServeTLS(":8443", handler, "cert.pem", "key.pem")
}

func safeTLSAgain(mux *http.ServeMux) error {
	// ok: use-tls
	return http.ListenAndServeTLS(":9443", mux, "cert.pem", "key.pem")
}

func safeNoServe() string {
	// ok: use-tls
	return "ListenAndServe in a comment is not a call"
}
