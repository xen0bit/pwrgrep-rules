function greet(name) {
  // ruleid: missing-template-string-indicator
  const s1 = `{name} hi`;
  return s1;
}
function welcome(user) {
  // ruleid: missing-template-string-indicator
  const s2 = `{user} welcome`;
  return s2;
}
function msg(id) {
  // ruleid: missing-template-string-indicator
  const s3 = `{id} done`;
  return s3;
}
function safeProper(name) {
  // ok: missing-template-string-indicator
  const o1 = `${name} hello`;
  return o1;
}
function safePlain() {
  // ok: missing-template-string-indicator
  const o2 = `hello world`;
  return o2;
}
function safeConcat(name) {
  // ok: missing-template-string-indicator
  const o3 = name + ' hello';
  return o3;
}
