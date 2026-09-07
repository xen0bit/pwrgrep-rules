function doublePlain() {
  // ruleid: useless-assignment
  x = 1;
  x = 2;
  return x;
}

function doubleLet() {
  // ruleid: useless-assignment
  let y = 1;
  y = 2;
  return y;
}

function doubleThird() {
  // ruleid: useless-assignment
  z = 1;
  z = 3;
  return z;
}

function distinctVars() {
  // ok: useless-assignment
  a = 1;
  b = 2;
  return a + b;
}

function selfAssign() {
  // ok: useless-assignment
  c = 1;
  c = c;
  return c;
}
