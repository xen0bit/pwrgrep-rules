function sanitizeLt(user) {
  // ruleid: detect-replaceall-sanitization
  const a = user.replace('<', '&lt;');
  return a;
}

function sanitizeGt(user) {
  // ruleid: detect-replaceall-sanitization
  const b = user.replaceAll('>', '&gt;');
  return b;
}

function sanitizeAmp(user) {
  // ruleid: detect-replaceall-sanitization
  const c = user.replace('&', '&amp;');
  return c;
}

function safeRegex(user) {
  // ok: detect-replaceall-sanitization
  const d = user.replace(/</g, '&lt;');
  return d;
}

function safeOtherChar(user) {
  // ok: detect-replaceall-sanitization
  const e = user.replace('a', 'b');
  return e;
}

function safeSlice(user) {
  // ok: detect-replaceall-sanitization
  const f = user.slice(1);
  return f;
}
