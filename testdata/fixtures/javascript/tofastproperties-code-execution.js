bb = require('bluebird');
function runOne(arg) {
  // ruleid: tofastproperties-code-execution
  bb.toFastProperties(arg);
}
function runAgain(x) {
  // ruleid: tofastproperties-code-execution
  bb.toFastProperties(x);
}
function runThird(v) {
  // ruleid: tofastproperties-code-execution
  bb.toFastProperties(v);
}
function safeLiteral() {
  // ok: tofastproperties-code-execution
  console.log('a', 'b');
}
function safeOther(a, b) {
  // ok: tofastproperties-code-execution
  console.log(a, b);
}
function safePlain(x, y) {
  // ok: tofastproperties-code-execution
  console.log(x, y);
}
