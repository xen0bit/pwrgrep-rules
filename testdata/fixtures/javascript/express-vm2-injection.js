const express = require('express');
const vm2 = require('vm2');
const app = express();

app.post('/eval', function (req, res) {
  const sandbox = new vm2.VM();
  // ruleid: express-vm2-injection
  sandbox.run(req.body.code);
  res.send('ok');
});

app.post('/file', function handler(req, res) {
  // ruleid: express-vm2-injection
  const out = new VMScript(req.body.code);
  res.send(out.code);
});

app.post('/safe', function (req, res) {
  const sandbox = new VM();
  // ok: express-vm2-injection
  sandbox.run('1 + 1');
  res.send('ok');
});

app.post('/ping', function (req, res) {
  // ok: express-vm2-injection
  res.send('pong');
});
