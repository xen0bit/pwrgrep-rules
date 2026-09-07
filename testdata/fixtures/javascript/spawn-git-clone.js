const cp = require('child_process');

function cloneRepo(url) {
  // ruleid: spawn-git-clone
  cp.spawn('git', ['clone', url]);
}

function cloneBranch(url, branch) {
  // ruleid: spawn-git-clone
  cp.spawn('git', ['clone', branch, url]);
}

function cloneMirror(url) {
  // ruleid: spawn-git-clone
  cp.spawn('git', ['clone', '--mirror', url]);
}

function cloneFixed() {
  // ok: spawn-git-clone
  cp.spawn('git', ['clone', 'https://example.com/repo.git']);
}

function cloneBare() {
  // ok: spawn-git-clone
  cp.spawn('git', ['clone', '--bare', 'https://example.com/repo.git']);
}

function plain() {
  // ok: spawn-git-clone
  cp.spawn('ls', ['-l']);
}
