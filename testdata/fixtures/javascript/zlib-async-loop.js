const zlib = require('zlib');
function gzipMany(items) {
  for (let i = 0; i < items.length; i++) {
    // ruleid: zlib-async-loop
    zlib.gzip(items[i]);
  }
}
function deflateEach(list) {
  list.forEach(function (x) {
    // ruleid: zlib-async-loop
    zlib.deflate(x);
  });
}
function inflateWhile(q) {
  while (q.length) {
    // ruleid: zlib-async-loop
    zlib.inflate(q.pop());
  }
}
function safeSync(items) {
  for (let i = 0; i < items.length; i++) {
    // ok: zlib-async-loop
    zlib.gzipSync(items[i]);
  }
}
function safeOutside(data) {
  // ok: zlib-async-loop
  zlib.gzip(data);
}
function safeOther(x, y) {
  // ok: zlib-async-loop
  console.log(x, y);
}
