// CWE-319: HTTP server
http = require('http');
// ruleid: using-http-server
http.createServer(function(req,res){});
// ruleid: using-http-server
srv = new http.Server();
// ruleid: using-http-server
http.createServer(function(req,res){});
// ruleid: using-http-server
srv2 = new http.Server(function(req,res){});
// ok: using-http-server
let secureNote1 = "https server uses secure context";
// ok: using-http-server
let secureNote2 = "http replaced with https";
// ok: using-http-server
let note = "use https.createServer with cert";
