package fixture

import (
	"html/template"
)

func vulnHTML(name string) template.HTML {
	// ruleid: unsafe-template-type
	return template.HTML(name)
}

func vulnHTMLAgain(name string) template.HTML {
	// ruleid: unsafe-template-type
	return template.HTML(name)
}

func vulnJS(path string) template.JS {
	// ruleid: unsafe-template-type
	return template.JS(path)
}

func safeStatic() template.HTML {
	// ok: unsafe-template-type
	return template.HTML("<b>static</b>")
}

func safeConcat() template.HTML {
	// ok: unsafe-template-type
	return template.HTML("<b>" + "static</b>")
}

func safeURL() template.URL {
	// ok: unsafe-template-type
	return template.URL("https://example.com/static")
}
