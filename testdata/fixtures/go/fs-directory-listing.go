package fixture

import (
	"net/http"
)

func vulnHandle(dir string) {
	fs := http.FileServer(http.Dir(dir))
	// ruleid: fs-directory-listing
	http.Handle("/files/", fs)
}

func vulnServe(dir string) {
	fs := http.FileServer(http.Dir(dir))
	// ruleid: fs-directory-listing
	_ = http.ListenAndServe(":8080", fs)
}

func vulnInline(dir string) {
	// ruleid: fs-directory-listing
	_ = http.ListenAndServe(":8080", http.FileServer(http.Dir(dir)))
}

func safeStatic(w http.ResponseWriter, r *http.Request) {
	// ok: fs-directory-listing
	http.ServeFile(w, r, "index.html")
}

func safeHandler(w http.ResponseWriter, r *http.Request) {
	// ok: fs-directory-listing
	http.NotFound(w, r)
}

func safeNoServer(dir string) http.Handler {
	// ok: fs-directory-listing
	return http.FileServer(http.Dir(dir))
}
