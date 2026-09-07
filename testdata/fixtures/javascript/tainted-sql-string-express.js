const express = require('express');
const app = express();

app.get('/user', function (req, res) {
  // ruleid: tainted-sql-string
  const q = 'SELECT * FROM users WHERE id=' + req.query.id;
  db.query(q);
});

app.post('/login', function handler(req, res) {
  // ruleid: tainted-sql-string
  const q = `SELECT * FROM admins WHERE name=${req.body.name}`;
  db.query(q);
});

app.get('/active', function (req, res) {
  // ok: tainted-sql-string
  const q = 'SELECT * FROM users WHERE active=1';
  db.query(q);
});

app.get('/count', function (req, res) {
  const table = 'users';
  // ok: tainted-sql-string
  const q = 'SELECT COUNT(*) FROM ' + table;
  db.query(q);
});
