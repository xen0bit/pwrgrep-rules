function verifyNone(token) {
  // ruleid: jwt-none-alg
  var jose = require("jose");
  var { JWK, JWT } = jose;
  var t1 = JWT.verify(token, JWK.None);
  return t1;
}
function verifyNoneAgain(p) {
  // ruleid: jwt-none-alg
  var jose2 = require("jose");
  var { JWK, JWT } = jose2;
  var t2 = JWT.verify(p, JWK.None);
  return t2;
}
function verifyNoneThird(p) {
  // ruleid: jwt-none-alg
  var jose3 = require("jose");
  var { JWK, JWT } = jose3;
  JWT.verify(p, JWK.None);
}
function safeVerify(token, key) {
  var jose4 = require("jose");
  var { JWK, JWT } = jose4;
  // ok: jwt-none-alg
  var s1 = JWT.verify(token, key);
  return s1;
}
function safeOther(token) {
  // ok: jwt-none-alg
  var s2 = console.log(token);
  return s2;
}
function safeParse(token) {
  // ok: jwt-none-alg
  var s3 = JSON.parse(token);
  return s3;
}
