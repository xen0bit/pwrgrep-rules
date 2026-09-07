function selfEq(x) {
  // ruleid: eqeq-is-bad
  const r1 = x == x;
  return r1;
}
function selfNe(y) {
  // ruleid: eqeq-is-bad
  const r2 = y != y;
  return r2;
}
function selfAgain(z) {
  // ruleid: eqeq-is-bad
  const r3 = z == z;
  return r3;
}
function safeCompare(a, b) {
  // ok: eqeq-is-bad
  const s1 = a == b;
  return s1;
}
function safeStrict(a, b) {
  // ok: eqeq-is-bad
  const s2 = a === b;
  return s2;
}
function safeOne() {
  // ok: eqeq-is-bad
  const s3 = 1 == 1;
  return s3;
}
