// ruleid: calling-set-state-on-current-state
const [count, setCount] = useState(0);
function updateSame() {
  // ruleid: calling-set-state-on-current-state
  setCount(count);
}
function updateAgain() {
  // ruleid: calling-set-state-on-current-state
  setCount(count);
}
function updateThird() {
  // ruleid: calling-set-state-on-current-state
  setCount(count);
}
function safeNext(prev, next) {
  // ok: calling-set-state-on-current-state
  console.log(prev, next);
}
function safeOther(a, b) {
  // ok: calling-set-state-on-current-state
  console.log(a, b);
}
function safeInit(x, y) {
  // ok: calling-set-state-on-current-state
  console.log(x, y);
}
