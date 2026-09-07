package fixture

import (
	"fmt"
	"html/template"
	"net/http"
)

func vulnSprintf(name string) template.HTML {
	// ruleid: formatted-template-string
	return template.HTML(fmt.Sprintf("<b>%s</b>", name))
}

func vulnSprintfQuery(r *http.Request) template.HTML {
	// ruleid: formatted-template-string
	return template.HTML(fmt.Sprintf("<i>%s</i>", r.URL.Query().Get("x")))
}

func vulnSprintfQuoted(name string) template.HTML {
	// ruleid: formatted-template-string
	return template.HTML(fmt.Sprintf("<b>%q</b>", name))
}

func safeStatic() template.HTML {
	// ok: formatted-template-string
	return template.HTML("<b>static</b>")
}

func safeEscaped(name string) string {
	// ok: formatted-template-string
	return template.HTMLEscapeString(name)
}

func safePlain(name string) string {
	// ok: formatted-template-string
	return "hello " + name
}
