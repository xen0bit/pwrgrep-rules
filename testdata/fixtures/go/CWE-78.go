package fixture

import (
	"net/http"
	"os/exec"
	"syscall"
)

func viaExecCommand(r *http.Request) error {
	name := r.URL.Query().Get("cmd")
	// ruleid: go-os-command-injection
	cmd := exec.Command(name)
	return cmd.Run()
}

func viaExecCommandWithArgs(r *http.Request) error {
	arg := r.FormValue("arg")
	// ruleid: go-os-command-injection
	cmd := exec.Command(arg)
	return cmd.Run()
}

func viaCommandContext(r *http.Request) error {
	cmdStr := r.Header.Get("X-Cmd")
	// ruleid: go-os-command-injection
	cmd := exec.CommandContext(r.Context(), cmdStr)
	return cmd.Start()
}

func viaSyscallExec(r *http.Request) error {
	bin := r.URL.Query().Get("bin")
	// ruleid: go-os-command-injection
	return syscall.Exec(bin, []string{bin}, nil)
}

// ok: go-os-command-injection
func safeConstant() error {
	cmd := exec.Command("ls", "-la")
	return cmd.Run()
}

// ok: go-os-command-injection
func safeConfigured(bin string) error {
	cmd := exec.Command(bin)
	return cmd.Run()
}

func safeNoExec(r *http.Request) string {
	// ok: go-os-command-injection
	return r.URL.Query().Get("cmd")
}
