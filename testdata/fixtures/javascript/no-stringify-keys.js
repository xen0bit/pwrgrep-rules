function getByKey(obj, data) {
  const k = JSON.stringify(data);
  // ruleid: no-stringify-keys
  const v1 = obj[k];
  return v1;
}
function getAgain(o, x) {
  // ruleid: no-stringify-keys
  const v2 = o[JSON.stringify(x)];
  return v2;
}
function getThird(o, z) {
  // ruleid: no-stringify-keys
  const v3 = o[JSON.stringify(z)];
  return v3;
}
function safeDirect(obj) {
  // ok: no-stringify-keys
  const s1 = obj["static"];
  return s1;
}
function safeProp(obj, key) {
  // ok: no-stringify-keys
  const s2 = obj[key];
  return s2;
}
function safeOther(a, b) {
  // ok: no-stringify-keys
  console.log(a, b);
}
