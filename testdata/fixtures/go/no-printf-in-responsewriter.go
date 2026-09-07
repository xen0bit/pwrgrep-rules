package fixture

import (
	"fmt"
	"net/http"
)

func vulnSprintf(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	// ruleid: no-printf-in-responsewriter
	w.Write([]byte(fmt.Sprintf("<b>%s</b>", name)))
}

func vulnSprintfAgain(w http.ResponseWriter, r *http.Request) {
	// ruleid: no-printf-in-responsewriter
	w.Write([]byte(fmt.Sprintf("<i>%s</i>", r.URL.Query().Get("x"))))
}

func vulnErrorf(w http.ResponseWriter, r *http.Request) {
	// ruleid: no-printf-in-responsewriter
	w.Write([]byte(fmt.Errorf("%s", r.URL.Path).Error()))
}

func safeStatic(w http.ResponseWriter, r *http.Request) {
	// ok: no-printf-in-responsewriter
	w.Write([]byte("<b>static</b>"))
	_ = r
}

func safeVar(w http.ResponseWriter, r *http.Request) {
	body := []byte("hello")
	// ok: no-printf-in-responsewriter
	w.Write(body)
	_ = r
}

func safeFprintf(w http.ResponseWriter, r *http.Request) {
	// ok: no-printf-in-responsewriter
	fmt.Fprintf(w, "static")
	_ = r
}
