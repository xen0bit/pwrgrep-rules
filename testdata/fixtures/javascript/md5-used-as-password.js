const crypto = require('crypto');

function hashPassword(password) {
  const h = crypto.createHash('md5');
  h.update(password);
  // ruleid: md5-used-as-password
  return storePassword(h.digest('hex'));
}

function savePassword(password) {
  const h = crypto.createHash('md5');
  h.update(password);
  // ruleid: md5-used-as-password
  return savePasswordHash(h.digest('hex'));
}

function hashFile(path) {
  const h = crypto.createHash('md5');
  h.update(path);
  // ok: md5-used-as-password
  return h.digest('hex');
}

function hashPasswordSha(password) {
  const h = crypto.createHash('sha256');
  h.update(password);
  // ok: md5-used-as-password
  return storePassword(h.digest('hex'));
}
