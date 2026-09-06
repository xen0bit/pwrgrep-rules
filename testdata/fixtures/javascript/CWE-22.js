// CWE-22: Path traversal - untrusted path reaches filesystem.
const fs = require('fs');

function fromQuery(req, res) {
  const f = req.query.file;
  // ruleid: js-path-traversal
  fs.readFile(f, (err, data) => {});
}

function fromParams(req, res) {
  const p = req.params.path;
  // ruleid: js-path-traversal
  fs.readFileSync(p);
}

function fromBody(req, res) {
  const b = req.body.file;
  // ruleid: js-path-traversal
  fs.createReadStream(b);
}

function fromLocation() {
  const t = new URLSearchParams(location.search).get('file');
  const q = t;
  // ruleid: js-path-traversal
  fs.readFileSync(q);
}

function safeLiteral() {
  // ok: js-path-traversal
  fs.readFile('/var/data/config.json', () => {});
  // ok: js-path-traversal
  fs.readFileSync('/etc/hosts');
}

function safeConstant() {
  const name = 'report.csv';
  // ok: js-path-traversal
  fs.createReadStream('/var/data/' + name);
}
