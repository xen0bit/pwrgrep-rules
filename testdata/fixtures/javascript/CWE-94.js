// CWE-94/95: Code injection - untrusted input reaches eval/Function.
function handleEval(req, res) {
  const code = req.query.code;
  // ruleid: js-code-injection
  eval(code);
}

function handleFunction(req, res) {
  const fnBody = req.params.fn;
  // ruleid: js-code-injection
  const f = new Function(fnBody);
  f();
}

function handleTimeout(req, res) {
  const t = req.body.t;
  // ruleid: js-code-injection
  setTimeout(t, 1000);
}

function fromLocation() {
  const x = new URLSearchParams(location.search).get('x');
  // ruleid: js-code-injection
  eval(x);
}

function safeLiteral() {
  // ok: js-code-injection
  eval('2 + 2');
  // ok: js-code-injection
  const f2 = new Function('a', 'return a + 1');
  // ok: js-code-injection
  setTimeout(function() { console.log('hi'); }, 100);
}
