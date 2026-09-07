const shell = require('shelljs');

function runIt(cmd) {
  // ruleid: shelljs-exec-injection
  return shell.exec(cmd);
}

function runConcat(base, extra) {
  // ruleid: shelljs-exec-injection
  return shell.exec(base + extra);
}

function runStatic() {
  // ok: shelljs-exec-injection
  return shell.exec('ls');
}

function runEcho(msg) {
  // ok: shelljs-exec-injection
  console.log(msg);
  return shell.exec('echo done');
}
