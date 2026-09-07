package fixture

import (
	"net/http"
)

func vulnBare() *http.Cookie {
	// ruleid: cookie-missing-httponly
	return &http.Cookie{Name: "session", Value: "abc"}
}

func vulnPathOnly() *http.Cookie {
	// ruleid: cookie-missing-httponly
	return &http.Cookie{Name: "session", Value: "abc", Path: "/"}
}

func vulnSecureOnly() *http.Cookie {
	// ruleid: cookie-missing-httponly
	return &http.Cookie{Name: "session", Value: "abc", Secure: true}
}

func safeHttpOnly() *http.Cookie {
	// ok: cookie-missing-httponly
	return &http.Cookie{Name: "session", Value: "abc", HttpOnly: true}
}

func safeFull() *http.Cookie {
	// ok: cookie-missing-httponly
	return &http.Cookie{Name: "session", Value: "abc", Path: "/", Secure: true, HttpOnly: true}
}

func safeHttpOnlyFirst() *http.Cookie {
	// ok: cookie-missing-httponly
	return &http.Cookie{HttpOnly: true, Name: "session", Value: "abc"}
}
