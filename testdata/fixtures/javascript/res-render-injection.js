const express = require('express');
const app = express();

app.get('/page', function (req, res) {
  // ruleid: res-render-injection
  res.render(req.query.page);
});

app.post('/view', function handler(req, res) {
  // ruleid: res-render-injection
  res.render(req.body.view, {layout: 'main'});
});

app.get('/home', function (req, res) {
  // ok: res-render-injection
  res.render('home');
});

app.get('/about', function (req, res) {
  // ok: res-render-injection
  res.render('about', {layout: 'main'});
});
