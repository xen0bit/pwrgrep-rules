package fixture

import (
	"fmt"
	"net/http"
)

func vulnFormat(w http.ResponseWriter, r *http.Request) {
	// ruleid: no-fprintf-to-responsewriter
	fmt.Fprintf(w, "%s", r.URL.Query().Get("x"))
}

func vulnVar(w http.ResponseWriter, r *http.Request) {
	body := r.URL.Query().Get("x")
	// ruleid: no-fprintf-to-responsewriter
	fmt.Fprintf(w, body)
}

func vulnTwo(w http.ResponseWriter, r *http.Request) {
	// ruleid: no-fprintf-to-responsewriter
	fmt.Fprintf(w, "%s%s", r.URL.Path)
}

func safeStatic(w http.ResponseWriter, r *http.Request) {
	// ok: no-fprintf-to-responsewriter
	fmt.Fprintf(w, "static")
	_ = r
}

func safeConst(w http.ResponseWriter, r *http.Request) {
	// ok: no-fprintf-to-responsewriter
	fmt.Fprintf(w, "hello")
	_ = r
}

func safeWrite(w http.ResponseWriter, r *http.Request) {
	// ok: no-fprintf-to-responsewriter
	w.Write([]byte("static"))
	_ = r
}
