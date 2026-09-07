package fixture

import (
	"github.com/gorilla/sessions"
	"net/http"
)

func vulnNoneMode() {
	// ruleid: session-cookie-samesitenone
	opts := &sessions.Options{
		Path:     "/",
		SameSite: http.SameSiteNoneMode,
	}
	_ = opts
}

func vulnNoneModeFull() {
	// ruleid: session-cookie-samesitenone
	opts := &sessions.Options{
		Path:     "/",
		Secure:   true,
		HttpOnly: true,
		SameSite: http.SameSiteNoneMode,
	}
	_ = opts
}

func vulnNoneModeMinimal() {
	// ruleid: session-cookie-samesitenone
	opts := &sessions.Options{
		SameSite: http.SameSiteNoneMode,
	}
	_ = opts
}

func safeLax() {
	// ok: session-cookie-samesitenone
	opts := &sessions.Options{
		Path:     "/",
		SameSite: http.SameSiteLaxMode,
	}
	_ = opts
}

func safeStrict() {
	// ok: session-cookie-samesitenone
	opts := &sessions.Options{
		Path:     "/",
		Secure:   true,
		SameSite: http.SameSiteStrictMode,
	}
	_ = opts
}

func safeDefault() {
	// ok: session-cookie-samesitenone
	opts := &sessions.Options{
		Path:   "/",
		MaxAge: 3600,
	}
	_ = opts
}
