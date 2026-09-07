const express = require('express');
const app = express();

app.get('/go', function (req, res) {
  // ruleid: express-open-redirect
  res.redirect(req.query.next);
});

app.post('/submit', function handler(req, res) {
  // ruleid: express-open-redirect
  res.redirect(req.body.url);
});

app.get('/jump', function (req, res) {
  const target = req.query.dest;
  // ruleid: express-open-redirect
  res.redirect(target);
});

app.get('/home', function (req, res) {
  // ok: express-open-redirect
  res.redirect('/home');
});

app.get('/landing', function (req, res) {
  const target = '/landing';
  // ok: express-open-redirect
  res.redirect(target);
});

app.get('/logged', function (req, res) {
  console.log(req.query.next);
  // ok: express-open-redirect
  res.redirect('/static');
});
