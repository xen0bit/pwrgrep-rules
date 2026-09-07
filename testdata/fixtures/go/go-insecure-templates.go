package fixture

import "html/template"

// ruleid: go-insecure-templates
var vulnHTML template.HTML = "<b>hi</b>"

// ruleid: go-insecure-templates
var vulnCSS template.CSS = "x"

// ruleid: go-insecure-templates
var vulnJS template.JS = "y"

// ok: go-insecure-templates
var safeString = "plain"

// ok: go-insecure-templates
var safeInt = 42

// ok: go-insecure-templates
var safeBool = true
