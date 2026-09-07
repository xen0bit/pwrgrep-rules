package fixture

import (
	"net/http"
)

func vulnVar(w http.ResponseWriter, r *http.Request) {
	body := []byte(r.URL.Query().Get("x"))
	// ruleid: no-direct-write-to-responsewriter
	w.Write(body)
}

func vulnDeref(w *http.ResponseWriter, r *http.Request) {
	body := []byte(r.URL.Query().Get("x"))
	// ruleid: no-direct-write-to-responsewriter
	(*w).Write(body)
}

func vulnField(w http.ResponseWriter, r *http.Request) {
	data := r.URL.Query().Get("x")
	buf := []byte(data)
	// ruleid: no-direct-write-to-responsewriter
	w.Write(buf)
}

func safeBytesCall(w http.ResponseWriter, r *http.Request) {
	// ok: no-direct-write-to-responsewriter
	w.Write([]byte(r.URL.Query().Get("x")))
}

func safeStatic(w http.ResponseWriter, r *http.Request) {
	// ok: no-direct-write-to-responsewriter
	w.Write([]byte("static"))
	_ = r
}

func safeHeader(w http.ResponseWriter, r *http.Request) {
	// ok: no-direct-write-to-responsewriter
	w.Header().Set("Content-Type", "text/plain")
	_ = r
}
