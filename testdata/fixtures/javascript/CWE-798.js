// CWE-798: Hardcoded credential - secret literal in source.
const config = require('config');

// ruleid: js-hardcoded-credential
const password = 'hunter2-long-secret-123';
// ruleid: js-hardcoded-credential
const api_key = 'test-api-key-1234567890';
// ruleid: js-hardcoded-credential
const secret = 's3cr3t-value-123';
// ruleid: js-hardcoded-credential
const token = 'ghp_1234567890abcdef1234567890abcdef';

function safeEnv() {
  // ok: js-hardcoded-credential
  const password = process.env.PASSWORD;
  // ok: js-hardcoded-credential
  const apiKey = process.env.API_KEY;
  // ok: js-hardcoded-credential
  const secret = getSecret();
  // ok: js-hardcoded-credential
  const token = '';
}
