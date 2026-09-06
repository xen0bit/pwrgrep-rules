// CWE-1321: Prototype pollution - untrusted key reaches prototype.
function pollute(req, res) {
  const key = req.query.key;
  const val = req.query.val;
  // ruleid: js-prototype-pollution
  Object.assign({}, { [key]: val });
}

function pollute2(req, res) {
  const data = req.body;
  // ruleid: js-prototype-pollution
  Object.assign(Object.prototype, data);
}

function merge(req, res) {
  const k = new URLSearchParams(location.search).get('k');
  const v = location.hash.substring(1);
  const obj = {};
  // ruleid: js-prototype-pollution
  obj[k] = v;
  // ruleid: js-prototype-pollution
  Object.assign(obj, JSON.parse(v));
}

function safeLiteral() {
  // ok: js-prototype-pollution
  Object.assign({}, { a: 1 });
  // ok: js-prototype-pollution
  Object.assign(Object.prototype, { safe: 'value' });
  const obj = {};
  // ok: js-prototype-pollution
  obj.foo = 'bar';
}
