const express = require('express');
const expat = require('node-expat');
const app = express();

app.post('/stream', function (req, res) {
  const parser = new expat.Parser('UTF-8');
  // ruleid: express-expat-xxe
  parser.parse(req.body.chunk);
  res.send('ok');
});

app.post('/write', function handler(req, res) {
  const parser = new expat.Parser('UTF-8');
  // ruleid: express-expat-xxe
  parser.write(req.body.chunk);
  res.send('ok');
});

app.post('/safe', function (req, res) {
  const parser = new expat.Parser('UTF-8');
  // ok: express-expat-xxe
  parser.parse('<a>static</a>');
  res.send('ok');
});

app.post('/echo', function (req, res) {
  // ok: express-expat-xxe
  res.send(req.body.text);
});
