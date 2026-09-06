// CWE-89: a Lambda's event concatenated into a query.
//
// The event is whatever invoked the function, so it is caller-chosen in
// exactly the way a query string is. `query(text, values)` is the fix: the
// driver sends the values out of band and they cannot change the query.
const { Pool } = require('pg');
const pool = new Pool();

exports.handler = function (event, context) {
    // ruleid: tainted-sql-string
    return pool.query("SELECT * FROM users WHERE name = '" + event.name + "'");
};

function namedHandler(event, context) {
    // ruleid: tainted-sql-string
    return pool.query("DELETE FROM users WHERE id = " + event.id, []);
}

exports.bound = function (event, context) {
    // ok: tainted-sql-string
    return pool.query("SELECT * FROM users WHERE name = $1", [event.name]);
};

exports.fixed = function (event, context) {
    // ok: tainted-sql-string
    return pool.query("SELECT count(*) FROM users");
};
