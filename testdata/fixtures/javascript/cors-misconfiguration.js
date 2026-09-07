const express = require('express');
const app = express();

app.get('/data', function (req, res) {
  // ruleid: cors-misconfiguration
  res.set('Access-Control-Allow-Origin', req.query.origin);
});

app.post('/share', function handler(req, res) {
  // ruleid: cors-misconfiguration
  res.header('access-control-allow-origin', req.body.origin);
});

app.get('/static', function (req, res) {
  // ok: cors-misconfiguration
  res.set('Access-Control-Allow-Origin', 'https://example.com');
});

app.get('/type', function (req, res) {
  // ok: cors-misconfiguration
  res.set('Content-Type', 'application/json');
});
