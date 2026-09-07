const express = require('express');
require('puppeteer');
const app = express();

app.get('/go', function (req, res) {
  // ruleid: express-puppeteer-injection
  page.goto(req.query.url);
  res.send('ok');
});

app.post('/fill', function handler(req, res) {
  // ruleid: express-puppeteer-injection
  page.setContent(req.body.html);
  res.send('ok');
});

app.get('/static', function (req, res) {
  // ok: express-puppeteer-injection
  page.goto('https://example.com');
  res.send('ok');
});

app.get('/ping', function (req, res) {
  // ok: express-puppeteer-injection
  res.send('pong');
});
