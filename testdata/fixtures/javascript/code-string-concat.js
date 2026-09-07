const express = require('express');
const app = express();

app.get('/run', function (req, res) {
  // ruleid: code-string-concat
  eval(req.query.code);
});

app.post('/exec', function handler(req, res) {
  const code = req.body.code;
  // ruleid: code-string-concat
  eval(code);
});

app.get('/static', function (req, res) {
  // ok: code-string-concat
  eval('1 + 1');
});

app.get('/ping', function (req, res) {
  // ok: code-string-concat
  res.send('pong');
});
