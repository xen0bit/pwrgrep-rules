// CWE-611: XML External Entity via libxmljs/xml2js
//
// libxmljs and xml2js with defaults resolve external entities. Passing
// user input as the XML string lets an <!ENTITY> become a file read or SSRF.

function handle(req) {
  const xml = req.query.xml;
  // ruleid: js-xxe-2
  libxmljs.parseXml(xml);
  const data = req.body.data;
  // ruleid: js-xxe-2
  xml2js.parseString(data);
  const more = req.params.more;
  // ruleid: js-xxe-2
  xml2js.parseString(more, {});
}

function safe() {
  // ok: js-xxe-2
  libxmljs.parseXml("<root>hello</root>");
  // ok: js-xxe-2
  xml2js.parseString("<root/>");
  // ok: js-xxe-2
  xml2js.parseString("<root></root>", { explicitArray: true });
}
