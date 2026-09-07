const express = require('express');
const request = require('request');
const app = express();

app.get('/fetch', function (req, res) {
  // ruleid: express-ssrf
  request.get(req.query.url);
});

app.post('/hook', function handler(req, res) {
  // ruleid: express-ssrf
  request.post(req.body.target, {form: {a: 1}});
});

app.get('/health', function (req, res) {
  // ok: express-ssrf
  request.get('https://internal/health');
});

app.get('/ping', function (req, res) {
  const target = 'https://internal/ping';
  // ok: express-ssrf
  request.get(target);
});
