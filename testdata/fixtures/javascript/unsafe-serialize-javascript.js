s = require('serialize-javascript');
function serUnsafe(data) {
  // ruleid: unsafe-serialize-javascript
  const o1 = s(data, {unsafe: true});
  return o1;
}
function serUnsafeAgain(s, obj) {
  // ruleid: unsafe-serialize-javascript
  const o2 = s(obj, {unsafe: true});
  return o2;
}
function serUnsafeThird(input) {
  // ruleid: unsafe-serialize-javascript
  const o3 = s(input, {unsafe: true});
  return o3;
}
function safeSerialize(s, data) {
  // ok: unsafe-serialize-javascript
  const x1 = s(data, {});
  return x1;
}
function safeDefault(s, data) {
  // ok: unsafe-serialize-javascript
  const x2 = s(data);
  return x2;
}
function safeOther(data) {
  // ok: unsafe-serialize-javascript
  const x3 = JSON.stringify(data);
  return x3;
}
