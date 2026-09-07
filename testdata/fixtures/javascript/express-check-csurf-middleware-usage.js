exp = require('express');
// ruleid: express-check-csurf-middleware-usage
app = exp();
function second() {
  // ruleid: express-check-csurf-middleware-usage
  app2 = exp();
  return app2;
}
function third() {
  // ruleid: express-check-csurf-middleware-usage
  app3 = exp();
  return app3;
}
function safeWithCsurf() {
  // ok: express-check-csurf-middleware-usage
  console.log('safe', 'ok');
}
function safeOther(a, b) {
  // ok: express-check-csurf-middleware-usage
  console.log(a, b);
}
function safePlain(x, y) {
  // ok: express-check-csurf-middleware-usage
  console.log(x, y);
}
