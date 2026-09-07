function update(el, html) {
  // ruleid: prohibit-jquery-html
  el.html(html);
}

function appendIt(el, content) {
  // ruleid: prohibit-jquery-html
  el.html(content);
}

function clear(el) {
  // ok: prohibit-jquery-html
  el.html();
}

function setStatic(el) {
  // ok: prohibit-jquery-html
  el.html('<b>static</b>');
}
