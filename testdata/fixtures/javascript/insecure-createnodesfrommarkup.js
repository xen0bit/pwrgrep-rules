const markup = require('fbjs/lib/createNodesFromMarkup');

function render(html) {
  // ruleid: insecure-createnodesfrommarkup
  return markup.createNodesFromMarkup(html);
}

function renderAgain(content) {
  // ruleid: insecure-createnodesfrommarkup
  return markup.createNodesFromMarkup(content);
}

function renderStatic() {
  // ok: insecure-createnodesfrommarkup
  return markup.createNodesFromMarkup('<b>static</b>');
}

function renderOther(x) {
  // ok: insecure-createnodesfrommarkup
  return String(x);
}
