argon = require('argon2');
async function hashI(pwd) {
  opts = {type: 'argon2i'};
  // ruleid: unsafe-argon2-config
  // ruleid: unsafe-argon2-config
  // ruleid: unsafe-argon2-config
  const h1 = argon.hash(pwd, opts);
  return h1;
}
async function hashD(pwd) {
  o2 = {type: 'argon2d'};
  // ruleid: unsafe-argon2-config
  // ruleid: unsafe-argon2-config
  // ruleid: unsafe-argon2-config
  const h2 = argon.hash(pwd, o2);
  return h2;
}
async function hashAgain(pwd) {
  o = {type: 'argon2i'};
  // ruleid: unsafe-argon2-config
  // ruleid: unsafe-argon2-config
  // ruleid: unsafe-argon2-config
  const h3 = argon.hash(pwd, o);
  return h3;
}
async function safeSingle(pwd) {
  // ok: unsafe-argon2-config
  const s1 = argon.hash(pwd);
  return s1;
}
async function safeOther(pwd, x, y) {
  // ok: unsafe-argon2-config
  console.log(pwd, x, y);
}
async function safeLog(a, b, c) {
  // ok: unsafe-argon2-config
  console.log(a, b, c);
}
