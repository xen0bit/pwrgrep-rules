// CWE-532: Insertion of Sensitive Information into Log File
//
// Console and logger calls that write a password, secret or token expose it
// in log files which are often world-readable or shipped to third parties.

function leak(password, secret, apiKey) {
  // ruleid: js-sensitive-log
  console.log(password);
  // ruleid: js-sensitive-log
  console.info("password=" + password);
  // ruleid: js-sensitive-log
  console.debug(secret);
}

function safe() {
  // ok: js-sensitive-log
  console.log("user logged in");
  // ok: js-sensitive-log
  console.info("request processed");
  // ok: js-sensitive-log
  console.debug("redacted");
  // ok: js-sensitive-log
  logger.info("done");
}
