// CWE-319: HTTP cleartext request
http = require('http');
// ruleid: http-request
http.get("http://example.com", function(){});
// ruleid: http-request
http.request("http://example.com");
// ruleid: http-request
http.get("http://example.com/path", function(){});
// ruleid: http-request
http.request("http://example.com/api");
// ok: http-request
http.get("https://example.com");
// ok: http-request
http.request("https://example.com");
// ok: http-request
http.get("https://example.com/secure", function(){});
