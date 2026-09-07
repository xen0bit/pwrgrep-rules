const util = require('util');

function logIt(name) {
  // ruleid: unsafe-formatstring
  console.log('hello ' + name, '!');
}

function formatIt(name) {
  // ruleid: unsafe-formatstring
  console.log(util.format('hi ' + name, '!'));
}

function concatIt(first, last) {
  // ruleid: unsafe-formatstring
  console.log(first + last, '!');
}

function logStatic() {
  // ok: unsafe-formatstring
  console.log('hello', 'world');
}

function logPlain() {
  // ok: unsafe-formatstring
  console.log('done');
}
