// CWE-611: XXE via DOMParser - external entities
//
// DOMParser parsing attacker-controlled XML without disabling external entities
// allows file disclosure and SSRF. User input must not flow into parseFromString
// with text/xml unless entities are disabled.

function handle(req) {
  const xml = req.query.xml;
  // ruleid: js-xxe
  new DOMParser().parseFromString(xml, "text/xml");
}

function handle2(req) {
  const data = req.body.data;
  // ruleid: js-xxe
  new DOMParser().parseFromString(data, "text/xml");
}

function safeLiteral() {
  // ok: js-xxe
  new DOMParser().parseFromString("<root>hello</root>", "text/xml");
}

function safeJson(req) {
  const xml = req.query.xml;
  // ok: js-xxe
  JSON.parse(xml);
}
