// CWE-20: Improper input validation — query param reaches exec/query without validation.
package main

import (
    "database/sql"
    "net/http"
    "os/exec"
)

func vulnExec(w http.ResponseWriter, r *http.Request) {
    q := r.URL.Query().Get("q")
    // ruleid: go-input-validation
    exec.Command("sh", "-c", q)
}

func vulnQuery(w http.ResponseWriter, r *http.Request, db *sql.DB) {
    id := r.URL.Query().Get("id")
    // ruleid: go-input-validation
    db.Query("SELECT * FROM users WHERE id = " + id)
}

func vulnExec2(w http.ResponseWriter, r *http.Request) {
    cmd := r.URL.Query().Get("cmd")
    // ruleid: go-input-validation
    exec.Command(cmd)
}

func safeFixed(w http.ResponseWriter, r *http.Request) {
    // ok: go-input-validation
    exec.Command("ls")
    // ok: go-input-validation
    db, _ := sql.Open("sqlite3", ":memory:")
    db.Query("SELECT * FROM users WHERE id = 1")
}

func safeValidated(w http.ResponseWriter, r *http.Request) {
    q := r.URL.Query().Get("q")
    if q != "allowed" {
        http.Error(w, "bad", 400)
        return
    }
    // ok: go-input-validation
    exec.Command("echo", "fixed")
}
