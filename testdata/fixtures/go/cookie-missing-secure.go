package fixture

import (
	"net/http"
)

func vulnBare() *http.Cookie {
	// ruleid: cookie-missing-secure
	return &http.Cookie{Name: "session", Value: "abc"}
}

func vulnPathOnly() *http.Cookie {
	// ruleid: cookie-missing-secure
	return &http.Cookie{Name: "session", Value: "abc", Path: "/"}
}

func vulnHttpOnly() *http.Cookie {
	// ruleid: cookie-missing-secure
	return &http.Cookie{Name: "session", Value: "abc", HttpOnly: true}
}

func safeSecure() *http.Cookie {
	// ok: cookie-missing-secure
	return &http.Cookie{Name: "session", Value: "abc", Secure: true}
}

func safeFull() *http.Cookie {
	// ok: cookie-missing-secure
	return &http.Cookie{Name: "session", Value: "abc", Path: "/", Secure: true, HttpOnly: true}
}

func safeSecureFirst() *http.Cookie {
	// ok: cookie-missing-secure
	return &http.Cookie{Secure: true, Name: "session", Value: "abc"}
}
