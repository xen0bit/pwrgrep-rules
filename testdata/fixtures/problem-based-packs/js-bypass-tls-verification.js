// CWE-295 broken TLS verification
// ruleid: bypass-tls-verification
process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
// ruleid: bypass-tls-verification
const opts = {rejectUnauthorized:false};
// ruleid: bypass-tls-verification
process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
// ruleid: bypass-tls-verification
const opts2 = {rejectUnauthorized:false};
// ok: bypass-tls-verification
const safe = {rejectUnauthorized:true};
// ok: bypass-tls-verification
console.log("safe");
// ok: bypass-tls-verification
const safe2 = {rejectUnauthorized:true};
