// CWE-287: Improper Authentication — func Handler(w http.ResponseWriter...) outside authMiddleware
package fixture

import (
    "net/http"
)

// ruleid: go-missing-auth
func adminHandler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("secret admin data"))
}

// ruleid: go-missing-auth
func transferHandler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("transfer"))
}

// ruleid: go-missing-auth
func sensitiveHandler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("sensitive"))
}

// ok: go-missing-auth — contains authMiddleware check
func safeAdminHandler(w http.ResponseWriter, r *http.Request) {
    if !authMiddleware(r) {
        http.Error(w, "unauthorized", http.StatusUnauthorized)
        return
    }
    w.Write([]byte("secret admin data"))
}

// ok: go-missing-auth — RequireAuth check
func safeTransferHandler(w http.ResponseWriter, r *http.Request) {
    if !RequireAuth(r) {
        http.Error(w, "unauthorized", http.StatusUnauthorized)
        return
    }
    w.Write([]byte("transfer"))
}

func authMiddleware(r *http.Request) bool { return true }
func RequireAuth(r *http.Request) bool { return true }
