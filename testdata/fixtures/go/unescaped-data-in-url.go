package fixture

import (
	"fmt"
	"html/template"
)

func vulnSprintf(name string) template.URL {
	// ruleid: unescaped-data-in-url
	return template.URL(fmt.Sprintf("https://example.com/?q=%s", name))
}

func vulnSprintfPath(next string) template.URL {
	// ruleid: unescaped-data-in-url
	return template.URL(fmt.Sprintf("/go/%s", next))
}

func vulnSprintfQuoted(name string) template.URL {
	// ruleid: unescaped-data-in-url
	return template.URL(fmt.Sprintf("https://example.com/?q=%q", name))
}

func safeStatic() template.URL {
	// ok: unescaped-data-in-url
	return template.URL("https://example.com/static")
}

func safeEscaped(name string) string {
	// ok: unescaped-data-in-url
	return template.URLQueryEscaper(name)
}

func safePlain(name string) string {
	// ok: unescaped-data-in-url
	return "hello " + name
}
