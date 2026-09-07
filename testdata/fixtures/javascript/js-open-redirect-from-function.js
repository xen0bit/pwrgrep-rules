function goTo(url, fallback) {
  // ruleid: js-open-redirect-from-function
  location.href = url;
}

function goToAgain(dest, other) {
  // ruleid: js-open-redirect-from-function
  location.href = dest;
}

function replaceWith(target, backup) {
  // ruleid: js-open-redirect-from-function
  location.replace(target);
}

function goStatic(fallback) {
  // ok: js-open-redirect-from-function
  location.href = '/home';
}

function goConst(path) {
  // ok: js-open-redirect-from-function
  location.href = '/static';
}

function plain(url) {
  // ok: js-open-redirect-from-function
  console.log(url);
}
