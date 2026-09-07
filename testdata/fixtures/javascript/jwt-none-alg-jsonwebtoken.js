jwt = require("jsonwebtoken");
function verifyNone(token, key) {
  // ruleid: jwt-none-alg
  const t1 = jwt.verify(token, key, {algorithms: ['none']});
  return t1;
}
function verifyNoneAgain(token, pub) {
  // ruleid: jwt-none-alg
  const t2 = jwt.verify(token, pub, {algorithms: ['RS256', 'none']});
  return t2;
}
function verifyNoneThird(t, k) {
  // ruleid: jwt-none-alg
  const t3 = jwt.verify(t, k, {algorithms: ['none']});
  return t3;
}
function safeStrict(token, key) {
  // ok: jwt-none-alg
  const s1 = jwt.verify(token, key, {algorithms: ['RS256']});
  return s1;
}
function safeHs(token, key) {
  // ok: jwt-none-alg
  const s2 = jwt.verify(token, key, {algorithms: ['HS256']});
  return s2;
}
function safeOther(x) {
  // ok: jwt-none-alg
  const s3 = console.log(x);
  return s3;
}
