// ruleid: express-session-hardcoded-secret
sess = require('express-session');
function setupOne(app) {
  // ruleid: express-session-hardcoded-secret
  app.use(sess({secret: "hardcoded"}));
  return app;
}
function setupAgain(app) {
  // ruleid: express-session-hardcoded-secret
  app.use(sess({secret: "s3cr3t"}));
  return app;
}
function setupThird(app) {
  // ruleid: express-session-hardcoded-secret
  app.use(sess({secret: "abc"}));
  return app;
}
function safeNoCall(x) {
  // ok: express-session-hardcoded-secret
  const s1 = x + 1;
  return s1;
}
function safeOther(a) {
  // ok: express-session-hardcoded-secret
  const s2 = a;
  return s2;
}
function safePlain(b) {
  // ok: express-session-hardcoded-secret
  const s3 = b;
  return s3;
}
