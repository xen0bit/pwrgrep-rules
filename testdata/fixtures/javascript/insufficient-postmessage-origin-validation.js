function listenAnywhere(handler) {
  // ruleid: insufficient-postmessage-origin-validation
  window.addEventListener('message', handler);
}

function listenAgain(handler, opts) {
  // ruleid: insufficient-postmessage-origin-validation
  window.addEventListener('message', handler, opts);
}

function listenThird(handler) {
  // ruleid: insufficient-postmessage-origin-validation
  window.addEventListener('message', handler, false);
}

function listenClick(handler) {
  // ok: insufficient-postmessage-origin-validation
  window.addEventListener('click', handler);
}

function listenLoad(handler) {
  // ok: insufficient-postmessage-origin-validation
  window.addEventListener('load', handler, false);
}

function plain(handler) {
  // ok: insufficient-postmessage-origin-validation
  handler('message');
}
