const express = require('express');
const Sandbox = require('sandbox');
const app = express();

app.post('/eval', function (req, res) {
  const box = new Sandbox();
  // ruleid: express-sandbox-code-injection
  box.run(req.body.code);
  res.send('ok');
});

app.post('/run', function handler(req, res) {
  // ruleid: express-sandbox-code-injection
  new Sandbox().run(req.body.code);
  res.send('ok');
});

app.post('/safe', function (req, res) {
  const box = new Sandbox();
  // ok: express-sandbox-code-injection
  box.run('1 + 1');
  res.send('ok');
});

app.post('/ping', function (req, res) {
  // ok: express-sandbox-code-injection
  res.send('pong');
});
