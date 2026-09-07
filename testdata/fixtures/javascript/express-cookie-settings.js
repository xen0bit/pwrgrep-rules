const express = require('express');
const session = require('express-session');
const app = express();

// ruleid: express-cookie-session-default-name
app.use(session({cookie: {secure: true, httpOnly: true, domain: 'example.com', path: '/', expires: new Date(2147483647000)}}));
// ruleid: express-cookie-session-default-name
app.use(session({cookie: {secure: true, httpOnly: true, domain: 'example.org', path: '/app', expires: new Date(2147483647000)}}));
// ok: express-cookie-session-default-name
app.use(session({name: 'sid', cookie: {secure: true, httpOnly: true, domain: 'example.com', path: '/', expires: new Date(2147483647000)}}));
// ok: express-cookie-session-default-name
app.get('/ping', function (req, res) {
  res.send('pong');
});
