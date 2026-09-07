// ruleid: express-check-directory-listing
serve = require('serve-index');
function serveOne(app) {
  // ruleid: express-check-directory-listing
  // ruleid: express-check-directory-listing
  app.use(serve('public'));
  return app;
}
function serveAgain(app) {
  // ruleid: express-check-directory-listing
  // ruleid: express-check-directory-listing
  app.use(serve('files'));
  return app;
}
function serveDirect(app) {
  // ruleid: express-check-directory-listing
  // ruleid: express-check-directory-listing
  // ruleid: express-check-directory-listing
  app.use(require('serve-index')('docs'));
  return app;
}
function safeStatic(x) {
  // ok: express-check-directory-listing
  const s1 = x + 1;
  return s1;
}
function safeOther(a) {
  // ok: express-check-directory-listing
  const s2 = a;
  return s2;
}
function safePlain(b) {
  // ok: express-check-directory-listing
  const s3 = b;
  return s3;
}
