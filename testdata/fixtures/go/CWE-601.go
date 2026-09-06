// CWE-601: Open Redirect — tainted URL reaches http.Redirect.
package fixture

import (
	"net/http"
)

func vulnRedirect(w http.ResponseWriter, r *http.Request) {
	url := r.URL.Query().Get("next")
	// ruleid: go-open-redirect
	http.Redirect(w, r, url, http.StatusFound)
}

func vulnForm(w http.ResponseWriter, r *http.Request) {
	target := r.FormValue("url")
	// ruleid: go-open-redirect
	http.Redirect(w, r, target, 302)
}

func vulnHeader(w http.ResponseWriter, r *http.Request) {
	next := r.Header.Get("X-Next")
	// ruleid: go-open-redirect
	http.Redirect(w, r, next, http.StatusFound)
}

func safeLiteral(w http.ResponseWriter, r *http.Request) {
	// ok: go-open-redirect
	http.Redirect(w, r, "/home", http.StatusFound)
}

func safeAllowed(w http.ResponseWriter, r *http.Request) {
	url := r.URL.Query().Get("next")
	if url == "/home" || url == "/dashboard" {
		// ok: go-open-redirect
		http.Redirect(w, r, "/home", http.StatusFound)
	}
}
