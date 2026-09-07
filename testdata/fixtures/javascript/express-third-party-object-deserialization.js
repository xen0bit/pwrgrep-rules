const express = require('express');
const serializer = require('node-serialize');
const app = express();

app.post('/restore', function (req, res) {
  // ruleid: express-third-party-object-deserialization
  const obj = serializer.unserialize(req.body.data);
  res.send(obj.name);
});

app.post('/load', function handler(req, res) {
  // ruleid: express-third-party-object-deserialization
  const obj = serializer.deserialize(req.body.blob);
  res.send(obj.name);
});

app.post('/safe', function (req, res) {
  // ok: express-third-party-object-deserialization
  const obj = JSON.parse(req.body.data);
  res.send(obj.name);
});

app.post('/static', function (req, res) {
  // ok: express-third-party-object-deserialization
  const obj = serializer.unserialize('{"name":"guest"}');
  res.send(obj.name);
});
