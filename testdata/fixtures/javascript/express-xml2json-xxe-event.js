const express = require('express');
const xml2json = require('xml2json');
const app = express();

app.post('/upload', function (req, res) {
  // ruleid: express-xml2json-xxe-event
  req.on('data', function (chunk) {
    const out = xml2json.toJson(chunk);
    res.send(out);
  });
});

app.post('/stream', function handler(req, res) {
  // ruleid: express-xml2json-xxe-event
  req.on('end', function () {
    const out = xml2json.toJson(req.body.text);
    res.send(out);
  });
});

app.post('/plain', function (req, res) {
  req.on('data', function (chunk) {
    // ok: express-xml2json-xxe-event
    res.send(chunk.length);
  });
});

app.post('/direct', function (req, res) {
  // ok: express-xml2json-xxe-event
  const out = xml2json.toJson(req.body.text);
  res.send(out);
});
