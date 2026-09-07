package fixture

import (
	"github.com/lestrrat-go/libxml2/parser"
)

func vulnParse() {
	// ruleid: parsing-external-entities-enabled
	p := parser.New(parser.XMLParseNoEnt)
	_ = p
}

func vulnParseAgain() {
	// ruleid: parsing-external-entities-enabled
	p := parser.New(parser.XMLParseNoEnt)
	_ = p
}

func vulnParseThird() {
	// ruleid: parsing-external-entities-enabled
	p := parser.New(parser.XMLParseNoEnt)
	_ = p
}

func safeDefault() {
	// ok: parsing-external-entities-enabled
	p := parser.New()
	_ = p
}

func safeRecover() {
	// ok: parsing-external-entities-enabled
	p := parser.New(parser.XMLParseRecover)
	_ = p
}

func safeMention() string {
	// ok: parsing-external-entities-enabled
	return "XMLParseNoEnt in a comment is not use"
}
