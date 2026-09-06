// CWE-319: Old TLS via options
https = require('https');
constants = require('constants');
// ruleid: disallow-old-tls-versions2
options = {};
https.createServer(options, function(){});
// ruleid: disallow-old-tls-versions2
options2 = {};
https.createServer(options2, function(){});
// ruleid: disallow-old-tls-versions2
opts3 = {};
https.createServer(opts3, function(){});
// ruleid: disallow-old-tls-versions2
opts4 = {};
https.createServer(opts4, function(){});
// ok: disallow-old-tls-versions2
good = {secureOptions: constants.SSL_OP_NO_SSLv2 | constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv3};
https.createServer(good, function(){});
// ok: disallow-old-tls-versions2
good2 = {secureOptions: constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv3 | constants.SSL_OP_NO_SSLv2};
https.createServer(good2, function(){});
// ok: disallow-old-tls-versions2
good3 = {secureOptions: constants.SSL_OP_NO_SSLv3 | constants.SSL_OP_NO_TLSv1 | constants.SSL_OP_NO_SSLv2};
https.createServer(good3, function(){});
