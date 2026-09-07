const expat = require('node-expat');

function parseChunk(chunk) {
  const parser = new expat.Parser('UTF-8');
  // ruleid: expat-xxe
  parser.parse(chunk);
  return parser;
}

function writeChunk(data) {
  const parser = new expat.Parser('UTF-8');
  // ruleid: expat-xxe
  parser.write(data);
  return parser;
}

function parseStatic() {
  const parser = new expat.Parser('UTF-8');
  // ok: expat-xxe
  parser.parse('<a>static</a>');
  return parser;
}

function parserInfo(version) {
  // ok: expat-xxe
  return 'expat ' + version;
}
