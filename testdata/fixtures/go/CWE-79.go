package fixture

import (
	"html/template"
	"net/http"
)

func viaTemplateHTML(w http.ResponseWriter, r *http.Request) {
	q := r.URL.Query().Get("q")
	// ruleid: go-reflected-xss
	t := template.HTML(q)
	_ = t
}

func viaWrite(w http.ResponseWriter, r *http.Request) {
	name := r.FormValue("name")
	// ruleid: go-reflected-xss
	w.Write([]byte(name))
}

func viaTemplateHTMLHeader(w http.ResponseWriter, r *http.Request) {
	h := r.Header.Get("X-Name")
	// ruleid: go-reflected-xss
	out := template.HTML(h)
	_ = out
}

func viaWriteConcat(w http.ResponseWriter, r *http.Request) {
	val := r.URL.Query().Get("val")
	out := "<div>" + val + "</div>"
	// ruleid: go-reflected-xss
	w.Write([]byte(out))
}

// ok: go-reflected-xss
func safeConstant(w http.ResponseWriter) {
	t := template.HTML("hello")
	_ = t
	w.Write([]byte("hello"))
}

// ok: go-reflected-xss
func safeEscaped(w http.ResponseWriter) {
	safe := template.HTMLEscapeString("constant")
	w.Write([]byte(safe))
}

func safeFromConfig(w http.ResponseWriter, data string) {
	// ok: go-reflected-xss
	t := template.HTML(data)
	_ = t
}
