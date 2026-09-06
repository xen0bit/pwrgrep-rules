// CWE-89: a Lambda's event string concatenated into a query.
//
// The event is whatever invoked the function - an API Gateway request, an SNS
// message, a manual invoke - so it is caller-chosen in exactly the way a query
// string is. A `'` in it ends the literal and the rest of the value is SQL.
//
// The rule is anchored on the name `handler`, which is what the Lambda Go
// runtime calls, so the helpers below are not sources and the calls in them
// are not findings.
package main

import "database/sql"

func handler(event string, db *sql.DB) {
	// ruleid: tainted-sql-string
	db.Query("SELECT * FROM users WHERE name = '" + event + "'")
	// ruleid: tainted-sql-string
	db.Exec("DELETE FROM users WHERE name = '" + event + "'")
	// ok: tainted-sql-string
	db.Query("SELECT * FROM users WHERE name = ?", event)
	// ok: tainted-sql-string
	db.Query("SELECT count(*) FROM users")
}

func report(name string, db *sql.DB) {
	// ok: tainted-sql-string
	db.Query("SELECT * FROM audit WHERE name = '" + name + "'")
}
