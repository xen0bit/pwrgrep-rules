// CWE-319: Telnet cleartext
server = require('telnet');
// ruleid: telnet-request
server.connect({});
// ruleid: telnet-request
server.createServer(function(){});
// ruleid: telnet-request
server.connect({host: "example.com", port: 23});
// ruleid: telnet-request
server.createServer(function(c){ c.write("hello"); });
// ok: telnet-request
console.log("use ssh2 Client instead of telnet");
// ok: telnet-request
console.log("secure connection via TLS");
// ok: telnet-request
let secureNote = "telnet disabled, using ssh";
