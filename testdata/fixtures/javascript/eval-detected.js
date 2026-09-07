function runUser(code) {
  // ruleid: eval-detected
  eval(code);
}

function runAgain(input) {
  // ruleid: eval-detected
  eval(input);
}

function runIndirect(fn, code) {
  // ruleid: eval-detected
  fn(eval(code));
}

function runStatic() {
  // ok: eval-detected
  eval('2 + 2');
}

function runConst() {
  // ok: eval-detected
  eval('static');
}

function plain(code) {
  // ok: eval-detected
  console.log(code);
}
