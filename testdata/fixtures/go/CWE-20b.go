// CWE-20b: strconv.Atoi(FormValue) without bounds — improper input validation
package fixture

import (
    "net/http"
    "strconv"
)

func vuln1(w http.ResponseWriter, r *http.Request) {
    v := r.FormValue("age")
    // ruleid: go-20-strict
    n, _ := strconv.Atoi(v)
    _ = n
}

func vuln2(w http.ResponseWriter, r *http.Request) {
    x := r.URL.Query().Get("count")
    // ruleid: go-20-strict
    m, _ := strconv.ParseInt(x, 10, 64)
    _ = m
}

func vuln3(w http.ResponseWriter, r *http.Request) {
    val := r.PostFormValue("id")
    // ruleid: go-20-strict
    k, _ := strconv.Atoi(val)
    _ = k
}

func safeBounds(w http.ResponseWriter, r *http.Request) {
    allowlist := r.FormValue("age")
    n, _ := strconv.Atoi(allowlist)
    if n < 0 || n > 100 {
        http.Error(w, "bad", 400)
        return
    }
    // ok: go-20-strict
    _ = n
}

func safeFixed(w http.ResponseWriter, r *http.Request) {
    // ok: go-20-strict
    n, _ := strconv.Atoi("42")
    _ = n
}
