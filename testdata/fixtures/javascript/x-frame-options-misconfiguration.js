const express = require('express');
const app = express();

app.get('/frame', function (req, res) {
  // ruleid: x-frame-options-misconfiguration
  res.set('X-Frame-Options', req.query.opt);
});

app.post('/embed', function handler(req, res) {
  // ruleid: x-frame-options-misconfiguration
  res.setHeader('x-frame-options', req.body.opt);
});

app.get('/deny', function (req, res) {
  // ok: x-frame-options-misconfiguration
  res.set('X-Frame-Options', 'DENY');
});

app.get('/type', function (req, res) {
  // ok: x-frame-options-misconfiguration
  res.set('Content-Type', 'text/html');
});
