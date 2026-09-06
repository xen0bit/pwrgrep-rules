// CWE-20: Improper input validation — req.query without validation reaches sink.
const express = require('express');
const app = express();

app.get('/xss', (req, res) => {
  const id = req.query.id;
  // ruleid: javascript-input-validation
  document.getElementById('out').innerHTML = id;
});

app.get('/eval', (req, res) => {
  const cmd = req.query.cmd;
  // ruleid: javascript-input-validation
  eval(cmd);
});

app.get('/inner', (req, res) => {
  let q = req.query.q;
  // ruleid: javascript-input-validation
  el.innerHTML = q;
});

app.get('/safe', (req, res) => {
  const id = req.query.id;
  if (!/^[a-z0-9]+$/.test(id)) return res.status(400).send('bad');
  // ok: javascript-input-validation
  el.innerHTML = "fixed";
});

app.get('/safe2', (req, res) => {
  // ok: javascript-input-validation
  eval("fixed_string");
  // ok: javascript-input-validation
  document.getElementById('out').innerHTML = "hello";
});
