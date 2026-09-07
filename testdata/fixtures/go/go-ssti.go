package fixture

import (
	"fmt"
	"html/template"
	"net/http"
)

func vulnForm(w http.ResponseWriter, r *http.Request) {
	name := r.Form.Get("name")
	// ruleid: go-ssti
	tmpl = fmt.Sprintf("hello %s", name)
	t, _ := template.New("x").Parse(tmpl)
	_ = t
	_ = w
}

func vulnQuery(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	// ruleid: go-ssti
	tmpl = fmt.Sprintf("hello %s", name)
	t, _ := template.New("x").Parse(tmpl)
	_ = t
	_ = w
}

func vulnPath(w http.ResponseWriter, r *http.Request) {
	// ruleid: go-ssti
	tmpl = fmt.Sprintf("hello %s", r.URL.Path)
	t, _ := template.New("x").Parse(tmpl)
	_ = t
	_ = w
}

func safeStatic(w http.ResponseWriter) {
	// ok: go-ssti
	t, _ := template.New("x").Parse("hello world")
	_ = t
	_ = w
}

func safeConst(w http.ResponseWriter) {
	const msg = "hello world"
	// ok: go-ssti
	t, _ := template.New("x").Parse(msg)
	_ = t
	_ = w
}

func safeNoSprintf(name string) string {
	// ok: go-ssti
	return "hello " + name
}
