function checkEvil(input) {
  // ruleid: detect-redos
  const r1 = new RegExp("(a+)+$");
  return r1.test(input);
}
function checkEvilAgain(s) {
  // ruleid: detect-redos
  const r2 = /(a+)+$/.test(s);
  return r2;
}
function checkMatch(s) {
  // ruleid: detect-redos
  const m = s.match(/(a|aa)+$/);
  return m;
}
function safeSimple(s) {
  // ok: detect-redos
  const r3 = new RegExp("abc");
  return r3.test(s);
}
function safeLiteral(s) {
  // ok: detect-redos
  const r4 = /abc/.test(s);
  return r4;
}
function safeOther(s) {
  // ok: detect-redos
  const m2 = s.match(/abc/);
  return m2;
}
