package fixture

// CWE-22: a path built from a request opens whatever the request asked for.
//
// A name that arrives in a query parameter may be "../../etc/passwd" as
// easily as "avatar.png", and filepath.Join does not object - it cleans the
// result, which resolves the "..", it does not refuse it. Join("/srv/files",
// "../../etc/passwd") is "/etc/passwd", and the handler serves it.
//
// filepath.Clean is not a defence and is named here as the misconception it
// is: Clean("../../etc/passwd") is "../../etc/passwd". filepath.Base is,
// because it throws away every component but the last, after which there is
// nothing left to traverse with.

import (
	"net/http"
	"os"
	"path/filepath"
)

func servesAnyFile(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	// ruleid: go-path-from-untrusted-input
	data, err := os.ReadFile(filepath.Join("/srv/files", name))
	if err != nil {
		http.Error(w, "not found", http.StatusNotFound)
		return
	}
	w.Write(data)
}

func deletesAnyFile(w http.ResponseWriter, r *http.Request) {
	target := r.FormValue("target")
	path := filepath.Join("/srv/uploads", target)
	// ruleid: go-path-from-untrusted-input
	if err := os.Remove(path); err != nil {
		http.Error(w, "gone", http.StatusNotFound)
	}
}

func opensFromAHeader(r *http.Request) (*os.File, error) {
	name := r.Header.Get("X-File")
	// ruleid: go-path-from-untrusted-input
	return os.Open("/srv/data/" + name)
}

// Clean resolves the "..", it does not reject it, so this is the same bug
// with a call in it that looks like a check.
func cleanedIsStillTraversable(r *http.Request) ([]byte, error) {
	name := filepath.Clean(r.URL.Query().Get("name"))
	// ruleid: go-path-from-untrusted-input
	return os.ReadFile(filepath.Join("/srv/files", name))
}

// Base keeps the last component and throws the rest away, so there is
// nothing left to traverse with.
func servesOneDirectory(r *http.Request) ([]byte, error) {
	name := filepath.Base(r.URL.Query().Get("name"))
	// ok: go-path-from-untrusted-input
	return os.ReadFile(filepath.Join("/srv/files", name))
}

// Nothing from the request decides this path.
func readsItsOwnConfig() ([]byte, error) {
	// ok: go-path-from-untrusted-input
	return os.ReadFile("/etc/app/config.yaml")
}
