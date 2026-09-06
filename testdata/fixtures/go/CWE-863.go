// CWE-863: Incorrect Authorization — IDOR via r.URL.Query().Get("id") to db.Query without ctx check
// r.URL.Query().Get("id") flows into db.Query (SELECT) without ctx.Value("user") check allows IDOR.
package fixture

import (
    "database/sql"
    "net/http"
)

func vulnIDOR1(w http.ResponseWriter, r *http.Request, db *sql.DB) {
    id := r.URL.Query().Get("id")
    query := "SELECT * FROM users WHERE id = " + id
    // ruleid: go-863-idor
    rows, _ := db.Query(query)
    _ = rows
}

func vulnIDOR2(w http.ResponseWriter, r *http.Request, db *sql.DB) {
    id := r.URL.Query().Get("id")
    // ruleid: go-863-idor
    rows, _ := db.Query("SELECT * FROM accounts WHERE id = " + id)
    _ = rows
}

func vulnIDOR3(w http.ResponseWriter, r *http.Request, db *sql.DB) {
    id := r.URL.Query().Get("id")
    // ruleid: go-863-idor
    rows, _ := db.Query("SELECT * FROM data WHERE id = " + id)
    _ = rows
}

// ok: go-863-idor — checks ctx.Value before query, hardcoded query
func safeIDOR1(w http.ResponseWriter, r *http.Request, db *sql.DB) {
    user := r.Context().Value("user")
    _ = user
    rows, _ := db.Query("SELECT * FROM users WHERE id = 123")
    _ = rows
}

// ok: go-863-idor — hardcoded id, no taint
func safeIDOR2(w http.ResponseWriter, r *http.Request, db *sql.DB) {
    rows, _ := db.Query("SELECT * FROM users WHERE id = 123")
    _ = rows
}

// ok: go-863-idor — helper not a Query
func helperOne() {
    print("helper")
}
