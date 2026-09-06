package fixture

// CWE-94: Code Injection via templates - user input as template string
import (
	"html/template"
	"net/http"
)

func vuln1(w http.ResponseWriter, r *http.Request) {
	x := r.URL.Query().Get("tpl")
	// ruleid: go-code-injection
	tmpl, _ := template.New("x").Parse(x)
	_ = tmpl.Execute(w, nil)
}

func vuln2(w http.ResponseWriter, r *http.Request) {
	y := r.FormValue("body")
	// ruleid: go-code-injection
	t2, _ := template.New("y").Parse(y)
	_ = t2.Execute(w, nil)
}

func vuln3(w http.ResponseWriter, r *http.Request) {
	z := r.URL.Query().Get("q")
	// ruleid: go-code-injection
	t3, _ := template.New("z").Parse(z)
	_ = t3.Execute(w, nil)
}

func vuln4(w http.ResponseWriter, r *http.Request) {
	q := r.FormValue("tpl2")
	// ruleid: go-code-injection
	t4, _ := template.New("q").Parse(q)
	_ = t4.Execute(w, nil)
}

func safe1(w http.ResponseWriter) {
	// ok: go-code-injection
	tmpl, _ := template.New("x").Parse("hello {{.Name}}")
	_ = tmpl.Execute(w, nil)
}

func safe2(w http.ResponseWriter) {
	// ok: go-code-injection
	tmpl, _ := template.New("x").Parse("static")
	_ = tmpl.Execute(w, map[string]string{"a": "b"})
}

func safe3(w http.ResponseWriter) {
	// ok: go-code-injection
	tmpl, _ := template.New("x").Parse("fixed template")
	_ = tmpl.Execute(w, nil)
}
