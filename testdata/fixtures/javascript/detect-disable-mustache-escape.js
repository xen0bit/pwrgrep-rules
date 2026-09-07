function disableEscape(obj) {
  // ruleid: detect-disable-mustache-escape
  obj.escapeMarkup = false;
  return obj;
}
function disableAgain(cfg) {
  // ruleid: detect-disable-mustache-escape
  cfg.escapeMarkup = false;
}
function disableThird(o) {
  // ruleid: detect-disable-mustache-escape
  o.escapeMarkup = false;
}
function safeEnabled(obj) {
  // ok: detect-disable-mustache-escape
  obj.escapeMarkup = true;
  return obj;
}
function safeOther(obj) {
  // ok: detect-disable-mustache-escape
  obj.other = false;
  return obj;
}
function safeLog(x) {
  // ok: detect-disable-mustache-escape
  console.log(x);
}
