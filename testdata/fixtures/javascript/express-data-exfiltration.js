const express = require('express');
const app = express();

app.post('/merge', function (req, res) {
  // ruleid: express-data-exfiltration
  const out = Object.assign({}, req.body);
  res.send(out);
});

app.put('/update', function handler(req, res) {
  // ruleid: express-data-exfiltration
  const out = Object.assign({role: 'user'}, req.body);
  res.send(out);
});

app.get('/defaults', function (req, res) {
  // ok: express-data-exfiltration
  const out = Object.assign({}, {role: 'guest'});
  res.send(out);
});

app.get('/const', function (req, res) {
  // ok: express-data-exfiltration
  const out = Object.assign({a: 1}, {b: 2});
  res.send(out);
});
