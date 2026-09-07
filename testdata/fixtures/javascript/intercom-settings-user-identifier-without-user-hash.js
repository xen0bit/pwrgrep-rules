function bootEmail(userEmail) {
  // ruleid: intercom-settings-user-identifier-without-user-hash
  Intercom('boot', {email: userEmail});
}
function bootId(userId) {
  // ruleid: intercom-settings-user-identifier-without-user-hash
  Intercom('boot', {user_id: userId});
}
function bootVar(o, email) {
  // ruleid: intercom-settings-user-identifier-without-user-hash
  o = {email: email};
  Intercom('boot', o);
}
function safeHash(email, hash) {
  // ok: intercom-settings-user-identifier-without-user-hash
  Intercom('boot', {email: email, user_hash: hash});
}
function safeIdHash(uid, hash) {
  // ok: intercom-settings-user-identifier-without-user-hash
  Intercom('boot', {user_id: uid, user_hash: hash});
}
function safeOther(x, y, z) {
  // ok: intercom-settings-user-identifier-without-user-hash
  console.log(x, y, z);
}
