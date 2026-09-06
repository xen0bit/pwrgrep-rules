// CWE-319: Old TLS not disabled on HTTPS server
https = require('https');
constants = require('constants');
// ruleid: disallow-old-tls-versions1
https.createServer({}).listen(443);
// ruleid: disallow-old-tls-versions1
https.createServer({key: "k"}).listen(8443);
// ruleid: disallow-old-tls-versions1
https.createServer({cert: "c"}).listen(9443);
// ruleid: disallow-old-tls-versions1
https.createServer({key: "k2", cert: "c2"}).listen(8444);
// ok: disallow-old-tls-versions1
https.createServer({secureOptions: constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3 | constants.SSL_OP_NO_TLSv1}).listen(443);
// ok: disallow-old-tls-versions1
https.createServer({secureOptions: constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_SSLv3}).listen(443);
// ok: disallow-old-tls-versions1
https.createServer({secureOptions: constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv3}).listen(8443);
