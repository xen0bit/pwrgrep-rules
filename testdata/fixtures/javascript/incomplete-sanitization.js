function cleanTag(s) {
  // ruleid: incomplete-sanitization
  return s.replace('<', '');
}

function cleanAmp(s) {
  // ruleid: incomplete-sanitization
  return s.replace('&', '');
}

function cleanNewline(s) {
  // ruleid: incomplete-sanitization
  return s.replace('\n', '');
}

function cleanAll(s) {
  // ok: incomplete-sanitization
  return s.replace(/</g, '');
}

function cleanWord(s) {
  // ok: incomplete-sanitization
  return s.replace('ab', '');
}
