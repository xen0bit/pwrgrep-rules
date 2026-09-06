package fixture

import (
	"net/http"
	"os"
	"path/filepath"
)

func servesAnyFile(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	// ruleid: go-path-traversal
	data, _ := os.ReadFile("/srv/files/" + name)
	_ = data
}

func opensFromHeader(r *http.Request) (*os.File, error) {
	name := r.Header.Get("X-File")
	// ruleid: go-path-traversal
	return os.Open("/srv/data/" + name)
}

func opensFile(r *http.Request) error {
	target := r.FormValue("target")
	// ruleid: go-path-traversal
	return os.Remove("/srv/uploads/" + target)
}

func readsFromQuery(r *http.Request) ([]byte, error) {
	name := r.URL.Query().Get("file")
	// ruleid: go-path-traversal
	return os.ReadFile("/srv/files/" + name)
}

// ok: go-path-traversal
func servesOneDirectory(r *http.Request) ([]byte, error) {
	name := filepath.Base(r.URL.Query().Get("name"))
	return os.ReadFile(filepath.Join("/srv/files", name))
}

// ok: go-path-traversal
func readsItsOwnConfig() ([]byte, error) {
	return os.ReadFile("/etc/app/config.yaml")
}

func readsConfigured(path string) ([]byte, error) {
	// ok: go-path-traversal
	return os.ReadFile(path)
}
