package fixture

import (
	"fmt"
	"html/template"
	"net/http"
)

func vulnSprintf(name string) template.JS {
	// ruleid: unescaped-data-in-js
	return template.JS(fmt.Sprintf("var x='%s';", name))
}

func vulnSprintfQuery(r *http.Request) template.JS {
	// ruleid: unescaped-data-in-js
	return template.JS(fmt.Sprintf("var q='%s';", r.URL.Query().Get("q")))
}

func vulnSprintfQuoted(name string) template.JS {
	// ruleid: unescaped-data-in-js
	return template.JS(fmt.Sprintf("var x=%q;", name))
}

func safeStatic() template.JS {
	// ok: unescaped-data-in-js
	return template.JS("var x='static';")
}

func safeEscaped(name string) string {
	// ok: unescaped-data-in-js
	return template.JSEscapeString(name)
}

func safePlain(name string) string {
	// ok: unescaped-data-in-js
	return "hello " + name
}
