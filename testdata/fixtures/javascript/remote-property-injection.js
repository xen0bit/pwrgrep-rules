const express = require('express');
const app = express();

app.post('/set', function (req, res) {
  const obj = {};
  // ruleid: remote-property-injection
  obj[req.params.key] = 1;
  res.send(obj);
});

app.post('/put', function handler(req, res) {
  const store = {};
  // ruleid: remote-property-injection
  store[req.body.name] = req.body.value;
  res.send(store);
});

app.post('/static', function (req, res) {
  const obj = {};
  // ok: remote-property-injection
  obj.name = 'static';
  res.send(obj);
});

app.post('/fixed', function (req, res) {
  const obj = {};
  // ok: remote-property-injection
  obj['key'] = 'value';
  res.send(obj);
});
