const express = require('express');
const wkhtmltoimage = require('wkhtmltoimage');
const app = express();

app.get('/shot', function (req, res) {
  // ruleid: express-wkhtmltoimage-injection
  wkhtmltoimage.generate(req.query.html, {pageSize: 'A4'});
  res.send('ok');
});

app.post('/card', function handler(req, res) {
  // ruleid: express-wkhtmltoimage-injection
  wkhtmltoimage.generate(req.body.html);
  res.send('ok');
});

app.get('/static', function (req, res) {
  // ok: express-wkhtmltoimage-injection
  wkhtmltoimage.generate('<h1>static</h1>');
  res.send('ok');
});

app.get('/ping', function (req, res) {
  // ok: express-wkhtmltoimage-injection
  res.send('pong');
});
