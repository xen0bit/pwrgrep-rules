function setContent(el, html) {
  // ruleid: insecure-innerhtml
  el.innerHTML = html;
}

function setContentAgain(el, html) {
  // ruleid: insecure-innerhtml
  document.getElementById('out').innerHTML = html;
}

function setAgain(el, html) {
  // ruleid: insecure-innerhtml
  el.innerHTML = html + '';
}

function setStatic(el) {
  // ok: insecure-innerhtml
  el.innerHTML = '<b>static</b>';
}

function setText(el, text) {
  // ok: insecure-innerhtml
  el.textContent = text;
}

function plain(el) {
  // ok: insecure-innerhtml
  el.innerHTML = '';
}
