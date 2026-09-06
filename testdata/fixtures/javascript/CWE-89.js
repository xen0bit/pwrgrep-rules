// CWE-89: SQL injection - untrusted input concatenated into query.
const db = require('db');

function byQuery(req, res) {
  const uid = req.query.uid;
  // ruleid: js-sql-injection
  db.query('SELECT * FROM users WHERE id=' + uid);
}

function byParams(req, res) {
  const name = req.params.name;
  // ruleid: js-sql-injection
  db.query('SELECT * FROM users WHERE name = \'' + name + '\'');
}

function byTemplate(req, res) {
  const user = req.body.user;
  // ruleid: js-sql-injection
  db.query(`SELECT * FROM users WHERE name='${user}'`);
}

function byVar(req, res) {
  const t = new URLSearchParams(location.search).get('t');
  const q = 'SELECT * FROM t WHERE id=' + t;
  // ruleid: js-sql-injection
  db.query(q);
}

function safeLiteral() {
  // ok: js-sql-injection
  db.query('SELECT * FROM users WHERE id=1');
  // ok: js-sql-injection
  db.query('SELECT * FROM users');
}

function safeParam(req, res) {
  const uid = req.query.uid;
  // ok: js-sql-injection
  db.query('SELECT * FROM users WHERE id=?', [uid]);
}
