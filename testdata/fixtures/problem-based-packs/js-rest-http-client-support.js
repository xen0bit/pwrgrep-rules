// CWE-319: cleartext HTTP via axios/got/node-rest-client. http:// URLs flag;
// https stays quiet.
const axios = require('axios');
const got = require('got');
const Client = require('node-rest-client').Client;
const c = new Client();

// ruleid: rest-http-client-support
axios.get("http://example.com");
// ruleid: rest-http-client-support
got("http://example.com/api");
// ruleid: rest-http-client-support
c.get("http://example.com/items", function(){});

// ok: rest-http-client-support
axios.get("https://example.com");
// ok: rest-http-client-support
got("https://example.com/api");
