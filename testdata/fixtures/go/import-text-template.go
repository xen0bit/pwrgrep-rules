package fixture

// ruleid: import-text-template
import "text/template"

// ruleid: import-text-template
import "text/template"

// ruleid: import-text-template
import "text/template"

func renderHTML() string {
	// ok: import-text-template
	return "html/template would escape; text/template does not"
}

func renderName() string {
	// ok: import-text-template
	return "the import lines above are the findings"
}

func renderPlain() string {
	// ok: import-text-template
	return "no template use here"
}
