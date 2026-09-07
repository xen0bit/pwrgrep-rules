function showHash() {
  // ruleid: dom-based-xss
  document.write(location.hash);
}

function showSearch() {
  // ruleid: dom-based-xss
  document.write(location.search);
}

function showHref() {
  // ruleid: dom-based-xss
  document.write(location.href);
}

function showStatic() {
  // ok: dom-based-xss
  document.write('<hr>');
}

function showConst() {
  const msg = '<b>hi</b>';
  // ok: dom-based-xss
  document.write(msg);
}

function plain() {
  // ok: dom-based-xss
  console.log('no write here');
}
