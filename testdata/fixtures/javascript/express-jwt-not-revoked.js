// ruleid: express-jwt-not-revoked
jwt = require('express-jwt');

function checkNoRevoke() {
  // ruleid: express-jwt-not-revoked
  const m1 = jwt({secret: 'hardcoded'});
  return m1;
}

function checkEmpty() {
  // ruleid: express-jwt-not-revoked
  const m2 = jwt({});
  return m2;
}

function safeRevoked(myFn) {
  // ok: express-jwt-not-revoked
  const o1 = jwt({isRevoked: myFn});
  return o1;
}

function safeRevokedAgain(check) {
  // ok: express-jwt-not-revoked
  const o2 = jwt({isRevoked: check});
  return o2;
}

function safeRevokedThird(verify) {
  // ok: express-jwt-not-revoked
  const o3 = jwt({isRevoked: verify});
  return o3;
}
