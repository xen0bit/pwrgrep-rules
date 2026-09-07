const vm2 = require('vm2');

function runCtx(input) {
  // ruleid: vm2-context-injection
  const sandbox = new vm2.VM({sandbox: {data: input}});
  return sandbox.run('code');
}

function runNodeCtx(input) {
  // ruleid: vm2-context-injection
  const sandbox = new vm2.NodeVM({sandbox: {data: input}});
  return sandbox.run('code', 'file.js');
}

function runStatic() {
  // ok: vm2-context-injection
  const sandbox = new vm2.VM({sandbox: {}});
  return sandbox.run('code');
}

function helper(x) {
  // ok: vm2-context-injection
  return String(x);
}
