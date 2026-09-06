// CWE-502: Deserialization of Untrusted Data - JSON.parse with prototype pollution
//
// JSON.parse without a reviver will materialize __proto__ and can pollute the
// prototype. Untrusted input must be validated or parsed with a safe reviver.

function handle(req) {
  const data = req.query.data;
  // ruleid: js-deserialization
  JSON.parse(data);
}

function handle2(req) {
  const body = req.body.payload;
  // ruleid: js-deserialization
  JSON.parse(body);
}

function safeLiteral() {
  // ok: js-deserialization
  JSON.parse('{"a":1}');
}

function safeWithReviver() {
  // ok: js-deserialization
  JSON.parse('{"a":1}', (k, v) => k === "__proto__" ? undefined : v);
}
