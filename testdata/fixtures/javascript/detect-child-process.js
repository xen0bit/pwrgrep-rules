const cp = require('child_process');

function runIt(cmd) {
  // ruleid: detect-child-process
  return cp.exec(cmd);
}

function spawnIt(cmd) {
  // ruleid: detect-child-process
  return cp.spawn(cmd, []);
}

const runArrow = (cmd) => {
  // ruleid: detect-child-process
  return cp.execSync(cmd);
};

function runStatic() {
  // ok: detect-child-process
  return cp.exec('ls');
}

function runDate() {
  // ok: detect-child-process
  return cp.execSync('date');
}
