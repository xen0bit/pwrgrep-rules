const fs = require('fs');

function readIt(name) {
  // ruleid: detect-non-literal-fs-filename
  return fs.readFileSync(name);
}

const readArrow = (name) => {
  // ruleid: detect-non-literal-fs-filename
  return fs.readFile(name, 'utf8', () => {});
};

function copyIt(src, dest) {
  // ruleid: detect-non-literal-fs-filename
  return fs.copyFileSync(src, dest);
}

function readStatic() {
  // ok: detect-non-literal-fs-filename
  return fs.readFileSync('/etc/hosts');
}

function readConfig() {
  // ok: detect-non-literal-fs-filename
  return fs.readFileSync('/etc/app.conf');
}
