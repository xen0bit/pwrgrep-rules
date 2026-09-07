function badAssign(x) {
  // ruleid: assigned-undefined
  undefined = x;
  return undefined;
}
function badVar(x) {
  // ruleid: assigned-undefined
  var undefined = x;
  return undefined;
}
function badLet(x) {
  // ruleid: assigned-undefined
  let undefined = x;
  return undefined;
}
function safeAssign(x) {
  // ok: assigned-undefined
  const y = x;
  return y;
}
function safeCompare(x) {
  // ok: assigned-undefined
  const z = x === undefined;
  return z;
}
function safeOther(x) {
  // ok: assigned-undefined
  console.log(x);
}
