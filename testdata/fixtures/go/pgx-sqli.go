package main

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v4"
)

var pgxdb *pgx.Conn

func init() {
	pgxdb, _ = pgx.Connect(context.Background(), "postgres://localhost/db")
}

func getUser(db *pgx.Conn, name string) {
	// ruleid: pgx-sqli
	db.Query(context.Background(), "SELECT * FROM users WHERE name = '"+name+"'")
}

func getUserFmt(db *pgx.Conn, name string) {
	// ruleid: pgx-sqli
	db.Query(context.Background(), fmt.Sprintf("SELECT * FROM users WHERE name = '%s'", name))
}

func getOk(db *pgx.Conn) {
	// ok: pgx-sqli
	db.Query(context.Background(), "SELECT * FROM users")
}

func getOkVar(db *pgx.Conn, q string) {
	// ok: pgx-sqli
	db.Query(context.Background(), q)
}
