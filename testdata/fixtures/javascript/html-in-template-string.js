function renderUser(name) {
  // ruleid: html-in-template-string
  return `<div>${name}</div>`;
}

function renderTitle(title) {
  // ruleid: html-in-template-string
  return `<h1>${title}</h1>`;
}

function renderLink(url, text) {
  // ruleid: html-in-template-string
  return `<a href="${url}">${text}</a>`;
}

function greet(name) {
  // ok: html-in-template-string
  return `hello ${name}`;
}

function count(n) {
  // ok: html-in-template-string
  return `count: ${n}`;
}

function plain() {
  // ok: html-in-template-string
  return 'no template here';
}
