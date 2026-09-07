const Sandbox = require('sandbox');

function runIt(code) {
  const box = new Sandbox();
  // ruleid: sandbox-code-injection
  box.run(code);
  return box;
}

function runAgain(code) {
  // ruleid: sandbox-code-injection
  new Sandbox().run(code);
  return true;
}

function runStatic() {
  const box = new Sandbox();
  // ok: sandbox-code-injection
  box.run('1 + 1');
  return box;
}

function helper(x) {
  // ok: sandbox-code-injection
  return String(x);
}
