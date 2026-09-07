package main

import (
	"fmt"
	"net/http"
	"strings"
)

func handler(w http.ResponseWriter, r *http.Request) {
	var tmpl = "%s"
	params := r.URL.Query()
	data, err := params["q"]
	_ = err
	// ruleid: wip-xss-using-responsewriter-and-printf
	w.Write([]byte(fmt.Sprintf(tmpl, data)))
}

func upper(w http.ResponseWriter, r *http.Request) {
	var tmpl = "%s"
	params := r.URL.Query()
	data, err := params["q"]
	_ = err
	interm := strings.ToUpper(data)
	// ruleid: wip-xss-using-responsewriter-and-printf
	w.Write([]byte(fmt.Sprintf(tmpl, interm)))
}

func safe(w http.ResponseWriter, r *http.Request) {
	var tmpl = "%s"
	// ok: wip-xss-using-responsewriter-and-printf
	w.Write([]byte(fmt.Sprintf(tmpl, "static")))
}

func plain(w http.ResponseWriter, r *http.Request) {
	// ok: wip-xss-using-responsewriter-and-printf
	w.Write([]byte("static"))
}
