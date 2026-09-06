// CWE-79: Cross-site scripting - untrusted input reaches DOM sink.
function handleXss(req, res) {
  const name = req.query.name;
  // ruleid: js-xss
  document.getElementById('out').innerHTML = name;
}

function handleWrite(req, res) {
  const html = req.params.html;
  // ruleid: js-xss
  document.write(html);
}

function handleAdjacent(req, res) {
  const body = req.body.input;
  // ruleid: js-xss
  document.body.insertAdjacentHTML('beforeend', body);
}

function fromLocation() {
  const x = new URLSearchParams(location.search).get('x');
  // ruleid: js-xss
  document.getElementById('out').innerHTML = x;
}

function safeConstant() {
  // ok: js-xss
  document.getElementById('out').innerHTML = '<b>static</b>';
  // ok: js-xss
  document.write('<hr>');
  // ok: js-xss
  document.getElementById('out').textContent = name;
}
