const cp = require('child_process');

function runShell(cmd) {
  // ruleid: dangerous-spawn-shell
  return cp.spawn('sh', ['-c', cmd]);
}

function runExec(cmd) {
  // ruleid: dangerous-spawn-shell
  return cp.exec('sh ' + cmd);
}

function runBash(cmd) {
  // ruleid: dangerous-spawn-shell
  return cp.spawnSync('bash', ['-c', cmd]);
}

function runStatic() {
  // ok: dangerous-spawn-shell
  return cp.spawn('sh', ['-c', 'ls']);
}

function runDate() {
  // ok: dangerous-spawn-shell
  return cp.exec('date');
}

function runLs() {
  // ok: dangerous-spawn-shell
  return cp.spawn('ls', ['-l']);
}
