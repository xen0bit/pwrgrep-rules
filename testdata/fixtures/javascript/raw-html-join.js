function joinUser(name) {
  // ruleid: raw-html-join
  document.write(['<div>', name].join(''));
}

function joinTitle(title) {
  // ruleid: raw-html-join
  document.write(['<h1>', title].join(''));
}

function joinThree(user, age) {
  // ruleid: raw-html-join
  document.write(['<p>', user, age].join(''));
}

function joinStatic() {
  // ok: raw-html-join
  document.write(['<hr>'].join(''));
}

function joinStaticTwo() {
  // ok: raw-html-join
  document.write(['<p>', 'static'].join(''));
}

function plain(name) {
  // ok: raw-html-join
  console.log(name);
}
