function makeRe(pattern) {
  // ruleid: detect-non-literal-regexp
  return new RegExp(pattern);
}

const buildRe = (pattern) => {
  // ruleid: detect-non-literal-regexp
  return RegExp(pattern, 'g');
};

function makeStatic() {
  // ok: detect-non-literal-regexp
  return new RegExp('^[a-z]+$');
}

function makeLiteral() {
  // ok: detect-non-literal-regexp
  return RegExp('foo');
}

function makeSlash() {
  // ok: detect-non-literal-regexp
  return new RegExp(/bar/);
}
