const express = require('express');
const fs = require('fs');
const app = express();

app.post('/upload1', (req, res) => {
  const filepath = req.file.path;
  // ruleid: js-434-upload
  fs.writeFile(filepath, req.file.buffer, () => {});
});

app.post('/upload2', (req, res) => {
  const p = req.files.upload.path;
  // ruleid: js-434-upload
  fs.createWriteStream(p);
});

app.post('/upload3', (req, res) => {
  const p = req.file.filename;
  // ruleid: js-434-upload
  fs.writeFile(p, req.file.buffer, () => {});
});

app.post('/upload4', (req, res) => {
  const p = req.files.doc.path;
  // ruleid: js-434-upload
  fs.createWriteStream(p, {flags: 'w'});
});

app.post('/safe1', (req, res) => {
  const filepath = "/tmp/fixed.txt";
  // ok: js-434-upload
  fs.writeFile(filepath, "fixed", () => {});
});

app.post('/safe2', (req, res) => {
  const p = "/tmp/safe.txt";
  // ok: js-434-upload
  fs.createWriteStream(p);
});

app.post('/safe3', (req, res) => {
  const safe = "/tmp/allowlist.txt";
  // ok: js-434-upload
  fs.writeFile(safe, "safe", () => {});
});
