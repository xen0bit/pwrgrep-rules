function handleOne(req, res) {
  unk = req.query.url;
  // ruleid: unknown-value-in-redirect
  res.redirect(unk);
}
function handleAgain(req, res) {
  u2 = req.query.next;
  // ruleid: unknown-value-in-redirect
  res.redirect(u2);
}
function handleThird(req, res) {
  u3 = req.params.target;
  // ruleid: unknown-value-in-redirect
  res.redirect(u3);
}
function safeAssign(x) {
  // ok: unknown-value-in-redirect
  const s1 = x + 1;
  return s1;
}
function safeOther(a, b, c) {
  // ok: unknown-value-in-redirect
  const s2 = a;
  return s2;
}
function safePlain(x) {
  // ok: unknown-value-in-redirect
  const s3 = x;
  return s3;
}
