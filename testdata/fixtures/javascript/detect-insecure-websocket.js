function connect1() {
  // ruleid: detect-insecure-websocket
  const u1 = "ws://example.com/socket";
  return u1;
}
function connect2() {
  // ruleid: detect-insecure-websocket
  const u2 = "ws://api.example.com/x";
  return u2;
}
function connect3() {
  // ruleid: detect-insecure-websocket
  const u3 = "ws://10.0.0.1/chat";
  return u3;
}
function safeTls() {
  // ok: detect-insecure-websocket
  const s1 = "wss://example.com/socket";
  return s1;
}
function safeLocal() {
  // ok: detect-insecure-websocket
  const s2 = "ws://localhost/socket";
  return s2;
}
function safeLoop() {
  // ok: detect-insecure-websocket
  const s3 = "ws://127.0.0.1/socket";
  return s3;
}
