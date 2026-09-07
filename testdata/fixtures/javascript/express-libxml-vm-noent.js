const libxml = require('libxmljs');

function parseUnsafe(xml) {
  // ruleid: express-libxml-vm-noent
  const d1 = libxml.parseXml(xml, {noent: true});
  return d1;
}

function parseUnsafeAgain(data) {
  // ruleid: express-libxml-vm-noent
  const d2 = libxml.parseXml(data, {noent: true, noblanks: true});
  return d2;
}

function parseUnsafeThird(doc) {
  // ruleid: express-libxml-vm-noent
  const d3 = libxml.parseXml(doc, {noent: true, huge: true});
  return d3;
}

function safeNoEnt(xml) {
  // ok: express-libxml-vm-noent
  const s1 = libxml.parseXml(xml, {noent: false});
  return s1;
}

function safeDefault(xml) {
  // ok: express-libxml-vm-noent
  const s2 = libxml.parseXml(xml, {});
  return s2;
}

function safeOther(xml) {
  // ok: express-libxml-vm-noent
  const s3 = JSON.parse(xml);
  return s3;
}
