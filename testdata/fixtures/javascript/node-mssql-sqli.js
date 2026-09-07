const sql = require('mssql');

function getUser(id) {
  // ruleid: node-mssql-sqli
  return sql.query('select * from t where id=' + id);
}

const getName = (name) => {
  // ruleid: node-mssql-sqli
  return sql.query('select * from t where name=' + name);
};

function getCount() {
  // ok: node-mssql-sqli
  return sql.query('select count(*) from t');
}

function getActive(flag) {
  // ok: node-mssql-sqli
  return sql.query('select * from t where active=1');
}
