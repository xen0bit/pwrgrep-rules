function update(userHtml) {
  // ruleid: jquery-insecure-method
  $('#out').html(userHtml);
}

function moveIt(el, userTarget) {
  // ruleid: jquery-insecure-method
  $(el).appendTo(userTarget);
}

function wrapIt(el, userWrapper) {
  // ruleid: jquery-insecure-method
  $(el).wrap(userWrapper);
}

function setStatic() {
  // ok: jquery-insecure-method
  $('#out').html('<b>static</b>');
}

function clearIt(el) {
  // ok: jquery-insecure-method
  $(el).html('');
}

function trustedMarkup(el, badge) {
  // Produced by the page, not by whoever sent it.
  // ok: jquery-insecure-method
  $(el).html(badge);
}
