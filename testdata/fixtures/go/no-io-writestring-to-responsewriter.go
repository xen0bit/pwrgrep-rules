package fixture

import (
	"io"
	"net/http"
)

func vulnQuery(w http.ResponseWriter, r *http.Request) {
	// ruleid: no-io-writestring-to-responsewriter
	_, _ = io.WriteString(w, r.URL.Query().Get("x"))
}

func vulnVar(w http.ResponseWriter, r *http.Request) {
	body := r.URL.Query().Get("x")
	// ruleid: no-io-writestring-to-responsewriter
	_, _ = io.WriteString(w, body)
}

func vulnPath(w http.ResponseWriter, r *http.Request) {
	// ruleid: no-io-writestring-to-responsewriter
	_, _ = io.WriteString(w, r.URL.Path)
}

func safeStatic(w http.ResponseWriter, r *http.Request) {
	// ok: no-io-writestring-to-responsewriter
	_, _ = io.WriteString(w, "static")
	_ = r
}

func safeConst(w http.ResponseWriter, r *http.Request) {
	// ok: no-io-writestring-to-responsewriter
	_, _ = io.WriteString(w, "hello")
	_ = r
}

func safeFprintf(w http.ResponseWriter, r *http.Request) {
	// ok: no-io-writestring-to-responsewriter
	_, _ = w.Write([]byte("static"))
	_ = r
}
