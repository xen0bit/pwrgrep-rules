const wkhtmltopdf = require('wkhtmltopdf');

function pdf(html) {
  // ruleid: wkhtmltopdf-injection
  return wkhtmltopdf(html);
}

function pdfOpts(html) {
  // ruleid: wkhtmltopdf-injection
  return wkhtmltopdf(html, {pageSize: 'A4'});
}

function pdfStatic() {
  // ok: wkhtmltopdf-injection
  return wkhtmltopdf('<h1>static</h1>');
}

function helper(x) {
  // ok: wkhtmltopdf-injection
  return String(x);
}
