// CWE-798b: Hardcoded credential — api_key longer than 20 chars.
// ruleid: typescript-hardcoded
const api_key = "AKIAIOSFODNN7EXAMPLEKEY12345";
// ruleid: typescript-hardcoded
const secret = "s3cr3t-value-123456789012345";
// ruleid: typescript-hardcoded
const password = "hunter2_hunter2_hunter2_hunter2";
// ruleid: typescript-hardcoded
const token = "ghp_1234567890abcdef1234567890";
// ruleid: typescript-hardcoded
let apiKey = "123456789012345678901234567890";

function safe() {
  // ok: typescript-hardcoded
  const api_key = process.env.API_KEY;
  // ok: typescript-hardcoded
  const secret = getSecret();
  // ok: typescript-hardcoded
  const token = "short";
  // ok: typescript-hardcoded
  const password = "";
  // ok: typescript-hardcoded
  const api_key_small = "abc";
}
