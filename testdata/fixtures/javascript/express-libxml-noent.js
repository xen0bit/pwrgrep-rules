const express = require('express');
const libxml = require('libxmljs');
const app = express();

app.post('/parse', function (req, res) {
  // ruleid: express-libxml-noent
  const doc = libxml.parseXml(req.body.xml, {noent: true});
  res.send(doc.toString());
});

app.post('/scan', function handler(req, res) {
  // ruleid: express-libxml-noent
  const doc = libxml.parseXmlString(req.body.doc, {noent: true, noblanks: true});
  res.send(doc.toString());
});

app.post('/safe', function (req, res) {
  // ok: express-libxml-noent
  const doc = libxml.parseXml(req.body.xml, {noent: false});
  res.send(doc.toString());
});

app.post('/plain', function (req, res) {
  // ok: express-libxml-noent
  const doc = JSON.parse(req.body.text);
  res.send(doc.title);
});
