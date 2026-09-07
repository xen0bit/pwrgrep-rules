const express = require('express');
const parser = require('xml2json');
const app = express();

app.post('/convert', function (req, res) {
  // ruleid: express-xml2json-xxe
  const out = parser.toJson(req.body.xml);
  res.send(out);
});

app.post('/feed', function handler(req, res) {
  // ruleid: express-xml2json-xxe
  const out = parser.toJson(req.body.feed, {reversible: true});
  res.send(out);
});

app.post('/safe', function (req, res) {
  // ok: express-xml2json-xxe
  const out = JSON.parse(req.body.text);
  res.send(out.key);
});

app.post('/static', function (req, res) {
  // ok: express-xml2json-xxe
  const out = parser.toJson('<a>static</a>');
  res.send(out);
});
