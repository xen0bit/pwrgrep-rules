// CWE-352: CSRF - form without token
// ruleid: javascript-csrf
const vuln1 = '<form method="POST" action="/transfer"><input name="amount"></form>';
// ruleid: javascript-csrf
const vuln2 = '<form method=\'POST\' action=\'/update\'><input name=\'email\'></form>';
// ruleid: javascript-csrf
const vulnFetch = 'fetch("/api", { method: "POST", body: "{}" })';

const safe1 = '<form method="POST" action="/transfer"><input type="hidden" name="_csrf" value="token"><input name="amount"></form>';
// ok: javascript-csrf
const ok1 = '<form method="POST" action="/transfer"><input name="_csrf" value="abc"></form>';
// ok: javascript-csrf
const ok2 = '<form method="POST"><input name="csrfToken" value="t"></form>';

function safeJs(token) {
  // ok: javascript-csrf
  fetch("/api", { method: "POST", headers: { "X-CSRF-Token": token } });
}
