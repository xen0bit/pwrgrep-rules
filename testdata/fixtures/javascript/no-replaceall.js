function useReplaceAll(s) {
  // ruleid: no-replaceall
  const a = s.replaceAll("a", "b");
  return a;
}
function useAgain(s) {
  // ruleid: no-replaceall
  const b = s.replaceAll("x", "y");
  return b;
}
function useThird(s, t) {
  // ruleid: no-replaceall
  const c = s.replaceAll(t, "z");
  return c;
}
function safeReplace(s) {
  // ok: no-replaceall
  const d = s.replace("a", "b");
  return d;
}
function safeSlice(s) {
  // ok: no-replaceall
  const e = s.slice(1);
  return e;
}
function safeOther(s) {
  // ok: no-replaceall
  console.log(s);
}
