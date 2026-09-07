function loadLodash() {
  // ruleid: lazy-load-module
  const _ = require('lodash');
  return _;
}
function loadMoment(name) {
  // ruleid: lazy-load-module
  const m = require(name);
  return m;
}
function loadAgain(p) {
  // ruleid: lazy-load-module
  const x = require(p);
  return x;
}
// ok: lazy-load-module
const fs = require('fs');
// ok: lazy-load-module
const path = require('path');
// ok: lazy-load-module
const crypto = require('crypto');
