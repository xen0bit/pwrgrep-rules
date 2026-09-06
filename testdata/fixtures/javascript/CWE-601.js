// CWE-601: Open redirect - untrusted input reaches redirect.
const express = require('express');
const app = express();

app.get('/redirect', (req, res) => {
  const url = req.query.url;
  // ruleid: js-open-redirect
  res.redirect(url);
});

app.get('/redir2', (req, res) => {
  const target = req.params.target;
  // ruleid: js-open-redirect
  res.redirect(302, target);
});

function fromLocation() {
  const u = new URLSearchParams(location.search).get('next');
  // ruleid: js-open-redirect
  window.location = u;
}

function fromHash() {
  const h = location.hash.substring(1);
  // ruleid: js-open-redirect
  location.href = h;
}

function safeLiteral() {
  // ok: js-open-redirect
  res.redirect('/home');
  // ok: js-open-redirect
  window.location = '/dashboard';
  // ok: js-open-redirect
  location.href = 'https://example.com/home';
}
