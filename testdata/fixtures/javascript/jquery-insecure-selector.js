function pickHash() {
  // ruleid: jquery-insecure-selector
  return $(location.hash);
}

function pickSearch() {
  // ruleid: jquery-insecure-selector
  return $(window.location.search);
}

function pickConcatHash() {
  // ruleid: jquery-insecure-selector
  return $('#' + location.hash);
}

// A parameter handed to jQuery is a selector the caller built, which the
// data shows is almost always static. It is not this finding.
function pick(sel) {
  // ok: jquery-insecure-selector
  return $(sel);
}

function pickConcat(id) {
  // ok: jquery-insecure-selector
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
