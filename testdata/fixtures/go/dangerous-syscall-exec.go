package fixture

import "syscall"

func vulnExec(bin string, args []string, env []string) error {
	// ruleid: dangerous-syscall-exec
	return syscall.Exec(bin, args, env)
}

func vulnExecAgain(bin string, args []string) error {
	// ruleid: dangerous-syscall-exec
	return syscall.Exec(bin, args, nil)
}

func vulnForkExec(bin string, args []string, env []string) error {
	// ruleid: dangerous-syscall-exec
	return syscall.ForkExec(bin, args, nil)
}

func safeStatic(args []string, env []string) error {
	// ok: dangerous-syscall-exec
	return syscall.Exec("/bin/ls", args, env)
}

func safeStaticFull() error {
	// ok: dangerous-syscall-exec
	return syscall.Exec("/bin/ls", []string{"ls", "-la"}, nil)
}

func safeNoExec(bin string) string {
	// ok: dangerous-syscall-exec
	return bin
}
