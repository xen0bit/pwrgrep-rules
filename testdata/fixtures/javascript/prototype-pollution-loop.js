function merge(target, source) {
  for (const k in source) {
    // ruleid: prototype-pollution-loop
    target[k] = source[k];
  }
  return target;
}

function copyAll(dst, src) {
  for (const k in src) {
    // ruleid: prototype-pollution-loop
    dst[k] = src[k];
  }
  return dst;
}

function setStatic(obj) {
  // ok: prototype-pollution-loop
  obj.name = 'static';
  return obj;
}

function fillIndexed(arr) {
  for (let i = 0; i < arr.length; i++) {
    // ok: prototype-pollution-loop
    arr[i] = 0;
  }
  return arr;
}
