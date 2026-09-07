function callDynamic(obj, name, arg) {
  // ruleid: unsafe-dynamic-method
  const r1 = obj[name](arg);
  return r1;
}
function callAgain(o, k) {
  // ruleid: unsafe-dynamic-method
  const r2 = o[k]();
  return r2;
}
function callViaVar(obj, key, val) {
  // ruleid: unsafe-dynamic-method
  fn = obj[key];
  fn(val);
}
function safeStatic(obj, arg) {
  // ok: unsafe-dynamic-method
  const s1 = obj.fixed(arg);
  return s1;
}
function safeLoop(obj) {
  // ok: unsafe-dynamic-method
  for (const k in obj) { console.log(k); }
}
function safeMap(arr) {
  // ok: unsafe-dynamic-method
  const s3 = arr.map(function (x) { return x; });
  return s3;
}
