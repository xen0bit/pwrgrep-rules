// CWE-77: Command injection via child_process.exec with shell metachar
const child_process = require('child_process');
const express = require('express');
const app = express();

app.get('/exec1', (req, res) => {
  const cmd = req.query.cmd;
  // ruleid: javascript-77-shell
  child_process.exec(cmd);
});

app.get('/exec2', (req, res) => {
  const input = req.params.input;
  // ruleid: javascript-77-shell
  child_process.execSync(input);
});

app.post('/exec3', (req, res) => {
  const bodyCmd = req.body.cmd;
  // ruleid: javascript-77-shell
  child_process.spawn(bodyCmd, { shell: true });
});

function safeArray(req, res) {
  const arg = req.query.arg;
  // ok: javascript-77-shell
  child_process.spawn("ls", [arg], { shell: false });
}

function safeFixed(req, res) {
  // ok: javascript-77-shell
  child_process.exec("ls -la");
}
