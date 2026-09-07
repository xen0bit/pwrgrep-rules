function renderHtml(tpl, html) {
  return tpl.replace('@@body', html);
}

function pageA(data) {
  // ruleid: unknown-value-with-script-tag
  return renderHtml('page', data.html + '<script src="a.js"></script>');
}

function pageB(content) {
  // ruleid: unknown-value-with-script-tag
  return renderHtml('page', '<script>' + content);
}

function pageStatic() {
  // ok: unknown-value-with-script-tag
  return renderHtml('page', '<b>static</b>');
}

function pageLiteral() {
  // ok: unknown-value-with-script-tag
  return renderHtml('page', '<script src="s.js"></script>');
}
