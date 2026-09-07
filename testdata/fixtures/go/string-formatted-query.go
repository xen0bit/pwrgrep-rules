package main

import (
	"database/sql"
	"fmt"
)

func qconcat(db *sql.DB, name string) {
	// ruleid: string-formatted-query
	db.Query("SELECT * FROM users WHERE name = '" + name + "'")
}

func qsprintf(db *sql.DB, name string) {
	// ruleid: string-formatted-query
	db.Query(fmt.Sprintf("SELECT * FROM users WHERE name = '%s'", name))
}

func qok(db *sql.DB) {
	// ok: string-formatted-query
	db.Query("SELECT * FROM users")
}

func qparam(db *sql.DB, name string) {
	// ok: string-formatted-query
	db.Query("SELECT * FROM users WHERE name = ?", name)
}
