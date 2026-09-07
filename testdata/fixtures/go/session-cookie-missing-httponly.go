package fixture

import (
	"github.com/gorilla/sessions"
	"net/http"
)

func vulnDefaults() {
	// ruleid: session-cookie-missing-httponly
	opts := &sessions.Options{
		Path:   "/",
		MaxAge: 3600,
	}
	_ = opts
}

func vulnSecureButNotHttpOnly() {
	// ruleid: session-cookie-missing-httponly
	opts := &sessions.Options{
		Path:   "/",
		Secure: true,
	}
	_ = opts
}

func vulnSameSiteOnly() {
	// ruleid: session-cookie-missing-httponly
	opts := &sessions.Options{
		Path:     "/",
		SameSite: http.SameSiteLaxMode,
	}
	_ = opts
}

func safeHttpOnly() {
	// ok: session-cookie-missing-httponly
	opts := &sessions.Options{
		Path:     "/",
		HttpOnly: true,
		Secure:   true,
	}
	_ = opts
}

func safeHttpOnlyMinimal() {
	// ok: session-cookie-missing-httponly
	opts := &sessions.Options{
		HttpOnly: true,
	}
	_ = opts
}

func safeFull() {
	// ok: session-cookie-missing-httponly
	opts := &sessions.Options{
		Path:     "/",
		HttpOnly: true,
		Secure:   true,
		SameSite: http.SameSiteStrictMode,
	}
	_ = opts
}
