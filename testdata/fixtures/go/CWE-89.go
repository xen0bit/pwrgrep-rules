package fixture

import (
	"database/sql"
	"fmt"
	"net/http"
)

func queryViaConcat(db *sql.DB, r *http.Request) (*sql.Rows, error) {
	name := r.URL.Query().Get("name")
	// ruleid: go-sqli-injection
	return db.Query("SELECT * FROM users WHERE name = '" + name + "'")
}

func execViaSprintf(db *sql.DB, r *http.Request) error {
	id := r.FormValue("id")
	q := fmt.Sprintf("SELECT * FROM t WHERE id = '%s'", id)
	// ruleid: go-sqli-injection
	_, err := db.Exec(q)
	return err
}

func queryContextConcat(db *sql.DB, r *http.Request) (*sql.Rows, error) {
	val := r.Header.Get("X-Val")
	// ruleid: go-sqli-injection
	return db.QueryContext(r.Context(), "SELECT * FROM t WHERE val = '"+val+"'")
}

func execConcat(db *sql.DB, r *http.Request) error {
	user := r.URL.Query().Get("user")
	// ruleid: go-sqli-injection
	_, err := db.Exec("DELETE FROM users WHERE name = '" + user + "'")
	return err
}

// ok: go-sqli-injection
func safeParam(db *sql.DB, r *http.Request) (*sql.Rows, error) {
	name := r.URL.Query().Get("name")
	return db.Query("SELECT * FROM users WHERE name = ?", name)
}

// ok: go-sqli-injection
func safeConstant(db *sql.DB) (*sql.Rows, error) {
	return db.Query("SELECT * FROM users")
}

func safeFromConfig(db *sql.DB, q string) (*sql.Rows, error) {
	// ok: go-sqli-injection
	return db.Query(q)
}
