package fixture

import (
  "database/sql"
  "net/http"
)

func vuln1(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  user := r.URL.Query().Get("user")
  q := "SELECT * FROM users WHERE name = '" + user + "'"
  // ruleid: go-sqli
  db.Query(q)
}

func vuln2(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  id := r.FormValue("id")
  // ruleid: go-sqli
  db.Exec("SELECT * FROM items WHERE id = " + id)
}

func safe1(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  // ok: go-sqli
  db.Query("SELECT * FROM users WHERE name = 'fixed'")
}

func safe2(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  user := "fixed"
  // ok: go-sqli
  db.Query("SELECT * FROM users WHERE name = '" + user + "'")
}

func vuln3(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  q := r.URL.Query().Get("q")
  // ruleid: go-sqli
  db.QueryRow("SELECT * FROM data WHERE q = '" + q + "'")
}

func vuln4(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  name := r.FormValue("name")
  query := "SELECT * FROM users WHERE name = '" + name + "'"
  // ruleid: go-sqli
  db.Query(query)
}

func safe3(w http.ResponseWriter, r *http.Request, db *sql.DB) {
  // ok: go-sqli
  db.Query("SELECT * FROM users WHERE name = ?", "fixed")
}
