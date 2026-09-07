thenify = require('thenify');
function wrapUnsafe(fn) {
  // ruleid: multiargs-code-execution
  const t1 = thenify(fn, {multiArgs: true});
  return t1;
}
function wrapAgain(fn) {
  // ruleid: multiargs-code-execution
  const t2 = thenify(fn, {multiArgs: 2});
  return t2;
}
function wrapThird(fn) {
  // ruleid: multiargs-code-execution
  const t3 = thenify(fn, {multiArgs: 1});
  return t3;
}
function safeFalse(fn) {
  // ok: multiargs-code-execution
  const s1 = thenify(fn, {multiArgs: false});
  return s1;
}
function safeOther(fn, a, b) {
  // ok: multiargs-code-execution
  console.log(fn, a, b);
}
function safePlain(x, y) {
  // ok: multiargs-code-execution
  console.log(x, y);
}
