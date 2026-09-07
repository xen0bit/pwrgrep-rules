function overOne() {
  // ruleid: escape-function-overwrite
  Mustache.escape = function (s) { return s; };
}
function overAgain(Mustache) {
  // ruleid: escape-function-overwrite
  Mustache.escape = customEscape;
}
function overThird() {
  mustache = require("mustache");
  // ruleid: escape-function-overwrite
  mustache.escape = function (t) { return t; };
}
function safeUse(Mustache, s) {
  // ok: escape-function-overwrite
  const o1 = Mustache.render(s);
  return o1;
}
function safeOther(a, b, c) {
  // ok: escape-function-overwrite
  console.log(a, b, c);
}
function safePlain(x, y, z) {
  // ok: escape-function-overwrite
  console.log(x, y, z);
}
