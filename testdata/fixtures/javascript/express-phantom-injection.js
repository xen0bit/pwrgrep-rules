const express = require('express');
require('phantom');
const app = express();

app.get('/shot', function (req, res) {
  // ruleid: express-phantom-injection
  phantom.open(req.query.url);
  res.send('ok');
});

app.post('/render', function handler(req, res) {
  // ruleid: express-phantom-injection
  phantom.setContent(req.body.html, 'http://example.com');
  res.send('ok');
});

app.get('/static', function (req, res) {
  // ok: express-phantom-injection
  phantom.open('https://example.com');
  res.send('ok');
});

app.get('/ping', function (req, res) {
  // ok: express-phantom-injection
  res.send('pong');
});
