function setKey(obj, key, val) {
  const current = obj[key];
  // ruleid: prototype-pollution-assignment
  obj[key] = val;
  return current;
}

function putProp(store, name, value) {
  const old = store[name];
  // ruleid: prototype-pollution-assignment
  store[name] = value;
  return old;
}

function setStatic(obj) {
  // ok: prototype-pollution-assignment
  obj.name = 'static';
  return obj;
}

function setLiteral(obj, key) {
  const current = obj[key];
  // ok: prototype-pollution-assignment
  obj[key] = 'default';
  return current;
}
