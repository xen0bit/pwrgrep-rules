function goTo($window, url) {
  // ruleid: detect-angular-open-redirect
  $window.location.href = url;
}

function goToAgain($window, dest) {
  // ruleid: detect-angular-open-redirect
  $window.location.href = dest;
}

function goToThird($window, target) {
  // ruleid: detect-angular-open-redirect
  $window.location.href = target;
}

function goStatic($window) {
  // ok: detect-angular-open-redirect
  $window.location.href = '/home';
}

function goConst($window) {
  // ok: detect-angular-open-redirect
  $window.location.href = '/static';
}

function plain(url) {
  // ok: detect-angular-open-redirect
  console.log(url);
}
