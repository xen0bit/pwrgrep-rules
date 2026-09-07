// useless-ternary: both branches return the same value, so the condition is dead.
export function pick(flag: boolean, a: string, b: string): string {
  // ruleid: useless-ternary
  const x = flag ? a : a;
  // ruleid: useless-ternary
  const y = flag ? b : b;
  // ok: useless-ternary
  const z = flag ? a : b;
  // ok: useless-ternary
  return flag ? x : y;
}
