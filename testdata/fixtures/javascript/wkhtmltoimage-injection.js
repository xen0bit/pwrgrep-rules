const wkhtmltoimage = require('wkhtmltoimage');

function shot(html) {
  // ruleid: wkhtmltoimage-injection
  return wkhtmltoimage.generate(html);
}

function shotOpts(html) {
  // ruleid: wkhtmltoimage-injection
  return wkhtmltoimage.generate(html, {pageSize: 'A4'});
}

function shotStatic() {
  // ok: wkhtmltoimage-injection
  return wkhtmltoimage.generate('<h1>static</h1>');
}

function helper(x) {
  // ok: wkhtmltoimage-injection
  return String(x);
}
