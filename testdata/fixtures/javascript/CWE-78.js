// CWE-78: OS command injection - untrusted input reaches shell.
const child_process = require('child_process');
const express = require('express');
const app = express();

app.get('/exec', (req, res) => {
  const cmd = req.query.cmd;
  // ruleid: js-command-injection
  child_process.exec(cmd);
});

app.get('/execSync', (req, res) => {
  const input = req.params.input;
  // ruleid: js-command-injection
  child_process.execSync(input);
});

app.post('/run', (req, res) => {
  const bodyCmd = req.body.cmd;
  // ruleid: js-command-injection
  child_process.spawn(bodyCmd, { shell: true });
});

function fromLocation() {
  const p = new URLSearchParams(location.search).get('cmd');
  // ruleid: js-command-injection
  child_process.spawnSync(p);
}

function safeLiteral() {
  // ok: js-command-injection
  child_process.exec('ls -l');
  // ok: js-command-injection
  child_process.spawn('ls', { shell: false });
  // ok: js-command-injection
  child_process.execSync('uptime');
}
