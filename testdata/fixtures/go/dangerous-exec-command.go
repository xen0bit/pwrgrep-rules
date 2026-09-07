package fixture

import "os/exec"

func vulnCmd(cmd string) error {
	// ruleid: dangerous-exec-command
	c := exec.Command(cmd, "-la")
	return c.Run()
}

func vulnCmdArgs(cmd string, args []string) error {
	// ruleid: dangerous-exec-command
	c := exec.Command(cmd, args[0])
	return c.Run()
}

func vulnCmdVariadic(cmd string, args []string) error {
	// ruleid: dangerous-exec-command
	c := exec.Command(cmd, args...)
	return c.Run()
}

func safeStatic() error {
	// ok: dangerous-exec-command
	c := exec.Command("ls", "-la")
	return c.Run()
}

func safeStaticEcho() error {
	// ok: dangerous-exec-command
	c := exec.Command("echo", "hello")
	return c.Run()
}

func safeStaticContext() error {
	// ok: dangerous-exec-command
	c := exec.Command("ls", "-la", "-h")
	return c.Run()
}
