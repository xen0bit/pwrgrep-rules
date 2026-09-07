const phantom = require('phantom');

function shot(url) {
  // ruleid: phantom-injection
  return phantom.open(url);
}

function renderIt(html) {
  // ruleid: phantom-injection
  return phantom.setContent(html, 'http://example.com');
}

function shotStatic() {
  // ok: phantom-injection
  return phantom.open('https://example.com');
}

function helper(x) {
  // ok: phantom-injection
  return String(x);
}
