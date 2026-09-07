function handleSearch() {
  const x = new URLSearchParams(location.search).get('x');
  // ruleid: detect-eval-with-expression
  eval(x);
}

function handleHash() {
  const y = new URLSearchParams(location.hash.substring(1)).get('y');
  // ruleid: detect-eval-with-expression
  eval(y);
}

function handleTimeout() {
  const z = new URLSearchParams(location.search).get('z');
  // ruleid: detect-eval-with-expression
  setTimeout(z, 1000);
}

function handleLocation() {
  const h = location.hash;
  // ruleid: detect-eval-with-expression
  eval(h);
}

function safeLiteral() {
  // ok: detect-eval-with-expression
  eval('2 + 2');
  // ok: detect-eval-with-expression
  setTimeout(function() { console.log('hi'); }, 100);
  // ok: detect-eval-with-expression
  const f = new Function('a', 'return a + 1');
}
