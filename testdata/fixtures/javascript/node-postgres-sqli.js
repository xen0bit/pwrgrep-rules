const {Client} = require('pg');

function getUser(id) {
  const db = new Client({});
  // ruleid: node-postgres-sqli
  return db.query('select * from t where id=' + id);
}

const getName = (name) => {
  const db = new Client({});
  // ruleid: node-postgres-sqli
  return db.query('select * from t where name=' + name);
};

function getCount() {
  const db = new Client({});
  // ok: node-postgres-sqli
  return db.query('select count(*) from t');
}

function getActive(flag) {
  const db = new Client({});
  // ok: node-postgres-sqli
  return db.query('select * from t where active=1');
}
