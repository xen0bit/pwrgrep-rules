function mergeUser(data) {
  const parsed = JSON.parse(data);
  // ruleid: insecure-object-assign
  return Object.assign({}, parsed);
}

function mergeBody(body) {
  const parsed = JSON.parse(body);
  // ruleid: insecure-object-assign
  return Object.assign({ role: 'user' }, parsed);
}

function mergeQuery(q) {
  const parsed = JSON.parse(q);
  // ruleid: insecure-object-assign
  const out = Object.assign({}, parsed);
  return out;
}

function mergeStatic() {
  const parsed = JSON.parse('{"role":"user"}');
  // ok: insecure-object-assign
  return Object.assign({}, parsed);
}

function mergeConst() {
  // ok: insecure-object-assign
  return Object.assign({}, { role: 'user' });
}

function plain(data) {
  // ok: insecure-object-assign
  return JSON.stringify(data);
}
