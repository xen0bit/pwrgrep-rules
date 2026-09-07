const express = require('express');
const app = express();

app.get('/file', function (req, res) {
  // ruleid: express-res-sendfile
  res.sendFile(req.query.path);
});

app.post('/doc', function handler(req, res) {
  // ruleid: express-res-sendfile
  res.sendfile(req.body.doc);
});

app.get('/about', function (req, res) {
  // ok: express-res-sendfile
  res.sendFile('/var/www/about.html');
});

app.get('/logo', function (req, res) {
  const logo = '/var/www/logo.png';
  // ok: express-res-sendfile
  res.sendFile(logo);
});
