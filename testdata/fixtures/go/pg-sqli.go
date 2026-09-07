package main

import (
	"fmt"

	"github.com/go-pg/pg/v10"
)

var gdb *pg.DB

func init() {
	gdb = pg.Connect(&pg.Options{Addr: "localhost:5432"})
}

func getUser(db *pg.DB, name string) {
	// ruleid: pg-sqli
	db.Query("SELECT * FROM users WHERE name = '" + name + "'")
}

func getUserFmt(db *pg.DB, name string) {
	// ruleid: pg-sqli
	db.Query(fmt.Sprintf("SELECT * FROM users WHERE name = '%s'", name))
}

func getOk(db *pg.DB) {
	// ok: pg-sqli
	db.Query("SELECT * FROM users")
}

func getOkVar(db *pg.DB, q string) {
	// ok: pg-sqli
	db.Query(q)
}
