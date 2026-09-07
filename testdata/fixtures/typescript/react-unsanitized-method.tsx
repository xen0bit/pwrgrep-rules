// react-unsanitized-method: document.write and insertAdjacentHTML parse
// their argument as markup. A value routed from a function argument through
// a local is the tainted shape (see the rule header).
function A(props, data) {
  const name = data.name;
  // ruleid: react-unsanitized-method
  document.write(name);
}

function B(props, data) {
  const html = data.html;
  // ruleid: react-unsanitized-method
  document.writeln(html);
}

function C(props, data) {
  const block = data.block;
  const el = document.createElement('div');
  // ruleid: react-unsanitized-method
  el.insertAdjacentHTML('beforeend', block);
}

// ok: react-unsanitized-method
function D() {
  document.write("fixed");
}

// ok: react-unsanitized-method
function E() {
  const el = document.createElement('div');
  el.insertAdjacentHTML('beforeend', "hello");
}
