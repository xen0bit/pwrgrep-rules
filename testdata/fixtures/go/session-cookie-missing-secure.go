package fixture

import (
	"github.com/gorilla/sessions"
	"net/http"
)

func vulnDefaults(store sessions.Store, r *http.Request) {
	// ruleid: session-cookie-missing-secure
	opts := &sessions.Options{
		Path:   "/",
		MaxAge: 3600,
	}
	_ = opts
}

func vulnHttpOnlyButNotSecure(store sessions.Store) {
	// ruleid: session-cookie-missing-secure
	opts := &sessions.Options{
		Path:     "/",
		HttpOnly: true,
	}
	_ = opts
}

func vulnSameSiteOnly(store sessions.Store) {
	// ruleid: session-cookie-missing-secure
	opts := &sessions.Options{
		Path:     "/",
		SameSite: http.SameSiteLaxMode,
	}
	_ = opts
}

func safeSecure(store sessions.Store) {
	// ok: session-cookie-missing-secure
	opts := &sessions.Options{
		Path:     "/",
		MaxAge:   3600,
		Secure:   true,
		HttpOnly: true,
	}
	_ = opts
}

func safeSecureMinimal(store sessions.Store) {
	// ok: session-cookie-missing-secure
	opts := &sessions.Options{
		Secure: true,
	}
	_ = opts
}

func safeSecureWithSameSite(store sessions.Store) {
	// ok: session-cookie-missing-secure
	opts := &sessions.Options{
		Path:     "/",
		Secure:   true,
		SameSite: http.SameSiteStrictMode,
	}
	_ = opts
}
