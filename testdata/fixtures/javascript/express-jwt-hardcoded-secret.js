jwt = require('express-jwt');
function checkOne() {
  // ruleid: express-jwt-hardcoded-secret
  const m1 = jwt({secret: "hardcoded123"});
  return m1;
}
function checkAgain() {
  // ruleid: express-jwt-hardcoded-secret
  const m2 = jwt({secret: "s3cr3t"});
  return m2;
}
function checkThird() {
  // ruleid: express-jwt-hardcoded-secret
  const m3 = jwt({secret: "abc"});
  return m3;
}
function safeEnv(secret) {
  // ok: express-jwt-hardcoded-secret
  const o1 = jwt({secret: secret});
  return o1;
}
function safeProcess() {
  // ok: express-jwt-hardcoded-secret
  const o2 = jwt({secret: process.env.SECRET});
  return o2;
}
function safeOther(a, b, c) {
  // ok: express-jwt-hardcoded-secret
  console.log(a, b, c);
}
