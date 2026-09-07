function makeParser(parser, handler) {
  // ruleid: sax-xxe
  require('sax');
  parser.on('doctype', handler);
  return parser;
}
function makeParser2(p, handler) {
  // ruleid: sax-xxe
  require('sax');
  p.ondoctype = handler;
  return p;
}
function makeParser3(parser, handler) {
  // ruleid: sax-xxe
  require('sax');
  parser.on('doctype', handler);
  return parser;
}
function safeNoDoctype(parser, handler) {
  require('sax');
  // ok: sax-xxe
  parser.on('text', handler);
  return parser;
}
function safeOther(parser, handler) {
  require('sax');
  // ok: sax-xxe
  parser.on('tag', handler);
  return parser;
}
function safeLog(x) {
  // ok: sax-xxe
  console.log(x);
}
