// CWE-918: Server-side request forgery - untrusted URL reaches fetch/request.
const express = require('express');
const axios = require('axios');
const http = require('http');

function byQuery(req, res) {
  const url = req.query.url;
  // ruleid: js-ssrf
  fetch(url);
}

function byParams(req, res) {
  const target = req.params.target;
  // ruleid: js-ssrf
  axios.get(target);
}

function byBody(req, res) {
  const u = req.body.url;
  // ruleid: js-ssrf
  axios.post(u);
}

function fromLocation() {
  const t = new URLSearchParams(location.search).get('url');
  // ruleid: js-ssrf
  http.get(t);
}

function safeLiteral() {
  // ok: js-ssrf
  fetch('https://example.com/api');
  // ok: js-ssrf
  axios.get('https://example.com/data');
  // ok: js-ssrf
  http.get('https://example.com/static');
}
