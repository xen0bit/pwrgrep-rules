const express = require('express');
const vm = require('vm');
const app = express();

app.post('/eval', function (req, res) {
  // ruleid: express-vm-injection
  vm.runInNewContext(req.body.code, {});
  res.send('ok');
});

app.post('/compile', function handler(req, res) {
  // ruleid: express-vm-injection
  const script = new vm.Script(req.body.code);
  res.send(script.runInNewContext({}));
});

app.post('/safe', function (req, res) {
  // ok: express-vm-injection
  vm.runInNewContext('1 + 1', {});
  res.send('ok');
});

app.post('/ping', function (req, res) {
  // ok: express-vm-injection
  res.send('pong');
});
