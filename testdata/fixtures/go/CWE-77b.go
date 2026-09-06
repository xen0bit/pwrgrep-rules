// CWE-77b: OS Command Injection via os/exec.Command shell metachar [|;&$`]
package fixture

import (
	"net/http"
	"os/exec"
)

func vuln1(w http.ResponseWriter, r *http.Request) {
	cmd := r.URL.Query().Get("cmd")
	// ruleid: go-77-shell
	exec.Command(cmd)
}

func vuln2(w http.ResponseWriter, r *http.Request) {
	arg := r.FormValue("arg")
	// ruleid: go-77-shell
	exec.Command(arg)
}

func vuln3(w http.ResponseWriter, r *http.Request) {
	x := r.Header.Get("X-Cmd")
	// ruleid: go-77-shell
	exec.CommandContext(r.Context(), x)
}

func safeArray(w http.ResponseWriter, r *http.Request) {
	arg := r.URL.Query().Get("arg")
	// ok: go-77-shell
	exec.Command("ls", arg)
}

func safeAllowlist(w http.ResponseWriter, r *http.Request) {
	allowlist := r.FormValue("cmd")
	if allowlist != "ls" {
		http.Error(w, "bad", 400)
		return
	}
	// ok: go-77-shell
	exec.Command(allowlist)
}
