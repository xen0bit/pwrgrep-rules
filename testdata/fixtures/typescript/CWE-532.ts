// CWE-532: Insertion of Sensitive Information into Log File
//
// Logging a password, secret or token exposes it in log files which are
// often world-readable or shipped to third parties.

function leak(password: string, secret: string) {
  // ruleid: typescript-sensitive-log
  console.log(password);
  // ruleid: typescript-sensitive-log
  console.info(secret);
  // ruleid: typescript-sensitive-log
  console.debug("api_key=" + secret);
}

function safe() {
  // ok: typescript-sensitive-log
  console.log("user logged in");
  // ok: typescript-sensitive-log
  console.info("request processed");
  // ok: typescript-sensitive-log
  console.debug("redacted");
}
