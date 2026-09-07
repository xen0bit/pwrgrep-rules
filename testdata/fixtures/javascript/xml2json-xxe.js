const parser = require('xml2json');

function convert(xml) {
  // ruleid: xml2json-xxe
  return parser.toJson(xml);
}

function convertOpts(xml) {
  // ruleid: xml2json-xxe
  return parser.toJson(xml, {reversible: true});
}

function convertStatic() {
  // ok: xml2json-xxe
  return parser.toJson('<a>static</a>');
}

function helper(x) {
  // ok: xml2json-xxe
  return String(x);
}
