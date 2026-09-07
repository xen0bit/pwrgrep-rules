package fixture

import (
	"fmt"
	"html/template"
)

func vulnSprintf(name string) template.HTMLAttr {
	// ruleid: unescaped-data-in-htmlattr
	return template.HTMLAttr(fmt.Sprintf("class=%s", name))
}

func vulnSprintfQuery(r *http.Request) template.HTMLAttr {
	// ruleid: unescaped-data-in-htmlattr
	return template.HTMLAttr(fmt.Sprintf("title=%s", r.URL.Query().Get("t")))
}

func vulnSprintfQuoted(name string) template.HTMLAttr {
	// ruleid: unescaped-data-in-htmlattr
	return template.HTMLAttr(fmt.Sprintf("data-x=%q", name))
}

func safeStatic() template.HTMLAttr {
	// ok: unescaped-data-in-htmlattr
	return template.HTMLAttr("class=static")
}

func safeEscaped(name string) string {
	// ok: unescaped-data-in-htmlattr
	return template.HTMLEscapeString(name)
}

func safePlain(name string) string {
	// ok: unescaped-data-in-htmlattr
	return "hello " + name
}
