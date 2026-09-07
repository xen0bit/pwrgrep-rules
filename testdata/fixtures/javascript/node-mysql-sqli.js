const mysql = require('mysql2');

function getUser(id) {
  // ruleid: node-mysql-sqli
  return mysql.query('select * from t where id=' + id);
}

const getName = (name) => {
  // ruleid: node-mysql-sqli
  return mysql.execute('select * from t where name=' + name);
};

function getCount() {
  // ok: node-mysql-sqli
  return mysql.query('select count(*) from t');
}

function getActive(flag) {
  // ok: node-mysql-sqli
  return mysql.query('select * from t where active=1');
}
