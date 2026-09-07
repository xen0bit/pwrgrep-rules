function update(html) {
  // ruleid: jquery-insecure-method
  $('#out').html(html);
}

function moveIt(el, target) {
  // ruleid: jquery-insecure-method
  $(el).appendTo(target);
}

function wrapIt(el, wrapper) {
  // ruleid: jquery-insecure-method
  $(el).wrap(wrapper);
}

function setStatic() {
  // ok: jquery-insecure-method
  $('#out').html('<b>static</b>');
}

function clearIt(el) {
  // ok: jquery-insecure-method
  $(el).html('');
}
