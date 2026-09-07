const knex = require('knex')({client: 'mysql'});
const express = require('express');
const app = express();

app.get('/user', function (req, res) {
  // ruleid: node-knex-sqli
  knex.raw('select * from users where id=' + req.query.id);
});

app.get('/name', function (req, res) {
  // ruleid: node-knex-sqli
  knex.whereRaw('name = ' + req.query.name);
});

app.get('/count', function (req, res) {
  // ok: node-knex-sqli
  knex.raw('select count(*) from users');
  res.send('ok');
});

app.get('/safe', function (req, res) {
  // ok: node-knex-sqli
  knex.raw('select * from users where active=1');
  res.send('ok');
});
