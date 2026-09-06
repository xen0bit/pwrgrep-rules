// CWE-862b: Missing Authorization — http.HandleFunc outside RBAC check
package fixture

import (
    "net/http"
)

func handlerAdmin(w http.ResponseWriter, r *http.Request) { w.Write([]byte("admin")) }
func handlerTransfer(w http.ResponseWriter, r *http.Request) { w.Write([]byte("transfer")) }
func handlerSensitive(w http.ResponseWriter, r *http.Request) { w.Write([]byte("sensitive")) }
func handlerSafe(w http.ResponseWriter, r *http.Request) { w.Write([]byte("safe")) }

func registerVuln() {
    // ruleid: go-862-rbac
    http.HandleFunc("/admin", handlerAdmin)
    // ruleid: go-862-rbac
    http.HandleFunc("/transfer", handlerTransfer)
    // ruleid: go-862-rbac
    http.HandleFunc("/sensitive", handlerSensitive)
}

func registerSafe() {
    // ok: go-862-rbac
    http.HandleFunc("/admin-safe", authMiddleware(handlerAdmin))
    // ok: go-862-rbac
    http.HandleFunc("/transfer-safe", RequireAuth(handlerTransfer))
}

func authMiddleware(h http.HandlerFunc) http.HandlerFunc { return h }
func RequireAuth(h http.HandlerFunc) http.HandlerFunc { return h }
func RBAC(h http.HandlerFunc) http.HandlerFunc { return h }
func checkRole(h http.HandlerFunc) http.HandlerFunc { return h }
