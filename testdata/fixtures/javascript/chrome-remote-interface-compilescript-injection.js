require('chrome-remote-interface');
function runOne(arg) {
  // ruleid: chrome-remote-interface-compilescript-injection
  rt.compileScript({expression: arg});
}
function runAgain(x) {
  // ruleid: chrome-remote-interface-compilescript-injection
  rt.evaluate({expression: x});
}
function runThird(v) {
  // ruleid: chrome-remote-interface-compilescript-injection
  rt.compileScript({expression: v});
}
function safeLiteral() {
  // ok: chrome-remote-interface-compilescript-injection
  console.log('a', 'b');
}
function safeOther(a, b) {
  // ok: chrome-remote-interface-compilescript-injection
  console.log(a, b);
}
function safePlain(x, y) {
  // ok: chrome-remote-interface-compilescript-injection
  console.log(x, y);
}
