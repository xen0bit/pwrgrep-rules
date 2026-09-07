// A non-static binary path (or argument vector) in `exec.Cmd` lets an
// attacker control what runs. The rule is textual: the struct literal keeps
// a space before `{`, a comma before each key, and trailing commas;
// hard-coded literals are excluded. Findings land on the literal line.
// The safe cases come first: the rule's text spans reach across functions, so
// a literal placed after a flagged line would merge into one spanning match.
package main

import "os/exec"

func safeLiteral() {
	// ok: dangerous-exec-cmd
	cmd := exec.Cmd {Dir: "/tmp",Path: "/bin/ls",}
	cmd.Run()
}

func safeEcho() {
	// ok: dangerous-exec-cmd
	cmd := exec.Cmd {Dir: "/tmp",Path: "/bin/echo",}
	cmd.Run()
}

func safeCat() {
	// ok: dangerous-exec-cmd
	cmd := exec.Cmd {Dir: "/tmp",Path: "/bin/cat",}
	cmd.Run()
}
func flagPath(userBin string) {
	// ruleid: dangerous-exec-cmd
	cmd := exec.Cmd {Args: args,Path: userBin,}
	cmd.Run()
}

func flagPathAgain(userBin string) {
	// ruleid: dangerous-exec-cmd
	cmd := exec.Cmd {Args: args,Path: userBin,}
	cmd.Run()
}

func flagPathThird(userBin string) {
	// ruleid: dangerous-exec-cmd
	cmd := exec.Cmd {Args: args,Path: userBin,}
	cmd.Run()
}

