function readOffset(buf, offset) {
  // ruleid: detect-buffer-noassert
  return buf.readUInt8(offset, true);
}

function readOffsetAgain(buf, offset) {
  // ruleid: detect-buffer-noassert
  return buf.readInt16BE(offset, true);
}

function writeOffset(buf, value, offset) {
  // ruleid: detect-buffer-noassert
  buf.writeDoubleLE(value, offset, true);
}

function safeRead(buf, offset) {
  // ok: detect-buffer-noassert
  return buf.readUInt8(offset, false);
}

function safeDefault(buf, offset) {
  // ok: detect-buffer-noassert
  return buf.readUInt8(offset);
}

function plain(buf, offset) {
  // ok: detect-buffer-noassert
  return buf.length + offset;
}
