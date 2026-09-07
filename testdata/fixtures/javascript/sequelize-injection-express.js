const express = require('express');
const db = require('./models');
const app = express();

app.get('/user', function (req, res) {
  // ruleid: express-sequelize-injection
  db.sequelize.query('select * from users where id=' + req.query.id);
});

app.post('/name', function handler(req, res) {
  // ruleid: express-sequelize-injection
  db.sequelize.query('select * from users where name=' + req.body.name);
});

app.get('/count', function (req, res) {
  // ok: express-sequelize-injection
  db.sequelize.query('select count(*) from users');
  res.send('ok');
});

app.get('/ping', function (req, res) {
  // ok: express-sequelize-injection
  res.send('pong');
});
