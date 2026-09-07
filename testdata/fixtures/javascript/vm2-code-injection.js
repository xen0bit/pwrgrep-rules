const vm2 = require('vm2');

function runIt(code) {
  const sandbox = new vm2.VM();
  // ruleid: vm2-code-injection
  sandbox.run(code);
  return sandbox;
}

function runScript(code) {
  // ruleid: vm2-code-injection
  const script = new vm2.VMScript(code);
  return script;
}

function runStatic() {
  const sandbox = new vm2.VM();
  // ok: vm2-code-injection
  sandbox.run('1 + 1');
  return sandbox;
}

function helper(x) {
  // ok: vm2-code-injection
  return String(x);
}
