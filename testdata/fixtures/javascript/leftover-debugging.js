function withAlert(msg) {
  // ruleid: javascript-alert
  alert(msg);
}
function withAlertAgain(x) {
  // ruleid: javascript-alert
  alert(x);
}
function withAlertEmpty() {
  // ruleid: javascript-alert
  alert();
}
function safeLog(msg) {
  // ok: javascript-alert
  console.log(msg);
}
function safeWarn(msg) {
  // ok: javascript-alert
  console.warn(msg);
}
function safeInfo(x) {
  // ok: javascript-alert
  console.info(x);
}
