function runUser(arg) {
  // ruleid: deno-dangerous-run
  const p1 = Deno.run({cmd: [arg]});
  return p1;
}
function runAgain(input) {
  // ruleid: deno-dangerous-run
  const p2 = Deno.run({cmd: [input]});
  return p2;
}
function runThird(cmd) {
  // ruleid: deno-dangerous-run
  const p3 = Deno.run({cmd: [cmd]});
  return p3;
}
function safeLiteral() {
  // ok: deno-dangerous-run
  const s1 = Deno.run({cmd: ["ls", "-l"]});
  return s1;
}
function safeOther(a, b) {
  // ok: deno-dangerous-run
  console.log(a, b);
}
function safeEcho(x, y) {
  // ok: deno-dangerous-run
  console.log(x, y);
}
