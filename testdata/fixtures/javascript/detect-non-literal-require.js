function loadDecl(name) {
  // ruleid: detect-non-literal-require
  return require(name);
}

const loadArrow = (name) => {
  // ruleid: detect-non-literal-require
  return require(name);
};

const loadAnon = function (name) {
  // ruleid: detect-non-literal-require
  return require(name);
};

function loadStatic() {
  // ok: detect-non-literal-require
  return require('fs');
}

function loadPath() {
  // ok: detect-non-literal-require
  return require('path');
}
