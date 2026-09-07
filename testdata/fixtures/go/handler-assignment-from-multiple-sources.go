package fixture

import (
	"github.com/gorilla/sessions"
	"net/http"
)

func vulnFlow(w http.ResponseWriter, r *http.Request) {
	q := r.query
	_ = q
	session, err := store.Get(r, "session")
	if err != nil {
		return
	}
	v := session.Values["key"]
	_ = v
	// ruleid: handler-assignment-from-multiple-sources
	v = q
	_ = v
}

func vulnDirect(w http.ResponseWriter, r *http.Request) {
	session, err := store.Get(r, "session")
	if err != nil {
		return
	}
	v := session.Values["key"]
	_ = v
	// ruleid: handler-assignment-from-multiple-sources
	v = r.query
	_ = v
}

func vulnVarForm(w http.ResponseWriter, r *http.Request) {
	q := r.query
	_ = q
	session, err := store.Get(r, "session")
	if err != nil {
		return
	}
	var n int = session.Values["n"].(int)
	_ = n
	// ruleid: handler-assignment-from-multiple-sources
	n = q
	_ = n
}

func safeNoQuery(w http.ResponseWriter, r *http.Request) {
	session, err := store.Get(r, "session")
	if err != nil {
		return
	}
	v := session.Values["key"]
	_ = v
	// ok: handler-assignment-from-multiple-sources
	v = "static-default"
	_ = v
}

func safeNoReassign(w http.ResponseWriter, r *http.Request) {
	q := r.query
	_ = q
	session, err := store.Get(r, "session")
	if err != nil {
		return
	}
	// ok: handler-assignment-from-multiple-sources
	v := session.Values["key"]
	_ = v
}

func safeConstantFlow(w http.ResponseWriter, r *http.Request) {
	session, err := store.Get(r, "session")
	if err != nil {
		return
	}
	v := session.Values["key"]
	_ = v
	// ok: handler-assignment-from-multiple-sources
	v = r.URL.Path
	_ = v
}
