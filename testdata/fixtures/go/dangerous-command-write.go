package fixture

import "os/exec"

func vulnWrite(cmd *exec.Cmd, data []byte) error {
	w, err := cmd.StdinPipe()
	if err != nil {
		return err
	}
	// ruleid: dangerous-command-write
	_, err = w.Write(data)
	return err
}

func vulnWriteAgain(cmd *exec.Cmd, data []byte) error {
	w, err := cmd.StdinPipe()
	if err != nil {
		return err
	}
	// ruleid: dangerous-command-write
	n, err := w.Write(data)
	_ = n
	return err
}

func vulnWriteThird(cmd *exec.Cmd, chunk []byte) error {
	w, err := cmd.StdinPipe()
	if err != nil {
		return err
	}
	// ruleid: dangerous-command-write
	_, err = w.Write(chunk)
	return err
}

func safeStatic(cmd *exec.Cmd) error {
	w, err := cmd.StdinPipe()
	if err != nil {
		return err
	}
	// ok: dangerous-command-write
	_, err = w.Write([]byte("static"))
	return err
}

func safeLiteral(cmd *exec.Cmd) error {
	w, err := cmd.StdinPipe()
	if err != nil {
		return err
	}
	// ok: dangerous-command-write
	_, err = w.Write("literal")
	return err
}

func safeNoPipe(data []byte) int {
	// ok: dangerous-command-write
	return len(data)
}
