function pick(sel) {
  // ruleid: jquery-insecure-selector
  return $(sel);
}

function pickHash() {
  // ruleid: jquery-insecure-selector
  return $(location.hash);
}

function pickConcat(id) {
  // ruleid: jquery-insecure-selector
  return $('#' + id);
}

function pickStatic() {
  // ok: jquery-insecure-selector
  return $('#out');
}

function pickThis() {
  // ok: jquery-insecure-selector
  return $(this);
}
