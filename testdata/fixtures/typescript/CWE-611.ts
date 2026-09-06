// CWE-611: XML External Entity via DOMParser/xml2js
//
// DOMParser and xml2js with defaults resolve external entities. Passing
// user input as the XML string lets an <!ENTITY> become a file read or SSRF.

function handle(req: any) {
  const xml = req.query.xml as string;
  // ruleid: typescript-xxe
  new DOMParser().parseFromString(xml, "text/xml");
  const data = req.body.data as string;
  // ruleid: typescript-xxe
  xml2js.parseString(data);
  const more = req.params.more as string;
  // ruleid: typescript-xxe
  xml2js.parseString(more, {});
}

function safe() {
  // ok: typescript-xxe
  new DOMParser().parseFromString("<root>hello</root>", "text/xml");
  // ok: typescript-xxe
  xml2js.parseString("<root/>");
  // ok: typescript-xxe
  JSON.parse("{}");
}
