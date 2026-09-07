const langEval = require('notevil');

function runIt(src) {
  // ruleid: express-detect-notevil-usage
  return langEval(src);
}

function runAgain(code) {
  // ruleid: express-detect-notevil-usage
  return langEval(code);
}

function runStatic() {
  // ok: express-detect-notevil-usage
  return langEval('1 + 1');
}

function helper(x) {
  // ok: express-detect-notevil-usage
  console.log('helper', x);
  return x;
}
