const express = require('express');
const app = express();

app.get('/vuln1', (req, res) => {
  const name = req.query.name;
  // ruleid: js-xss
  res.send("Hello " + name);
});

app.get('/vuln2', (req, res) => {
  const id = req.params.id;
  // ruleid: js-xss
  res.end(id);
});

app.get('/safe1', (req, res) => {
  // ok: js-xss
  res.send("Hello fixed");
});

app.get('/safe2', (req, res) => {
  const name = "fixed";
  // ok: js-xss
  res.send("Hello " + name);
});
