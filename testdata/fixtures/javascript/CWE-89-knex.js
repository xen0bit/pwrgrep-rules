// CWE-89: knex's raw escape hatch, given a Lambda event.
//
// `knex.raw` is knex's way of saying "I know what I am doing"; the string goes
// to the database as written. A `'` in the event ends the literal and the rest
// of the value is SQL. The second argument is the fix: knex binds it.
const knex = require('knex')({ client: 'pg' });

exports.handler = function (event, context) {
    // ruleid: knex-sqli
    return knex.raw("SELECT * FROM users WHERE name = '" + event.name + "'");
};

function whereRawHandler(event, context) {
    // ruleid: knex-sqli
    return knex.whereRaw("name = '" + event.name + "'", []);
}

exports.bound = function (event, context) {
    // ok: knex-sqli
    return knex.raw("SELECT * FROM users WHERE name = ?", [event.name]);
};

exports.fixed = function (event, context) {
    // ok: knex-sqli
    return knex.raw("SELECT count(*) FROM users");
};
