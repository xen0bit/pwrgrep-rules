package fixture

import (
	"golang.org/x/crypto/ssh"
)

func vulnDirect(config *ssh.ClientConfig) {
	// ruleid: avoid-ssh-insecure-ignore-host-key
	config.HostKeyCallback = ssh.InsecureIgnoreHostKey()
	_ = config
}

func vulnAgain() ssh.HostKeyCallback {
	// ruleid: avoid-ssh-insecure-ignore-host-key
	return ssh.InsecureIgnoreHostKey()
}

func vulnThird(hostname string) ssh.HostKeyCallback {
	// ruleid: avoid-ssh-insecure-ignore-host-key
	cb := ssh.InsecureIgnoreHostKey()
	_ = hostname
	return cb
}

func safeFixed(hostkey ssh.PublicKey) ssh.HostKeyCallback {
	// ok: avoid-ssh-insecure-ignore-host-key
	return ssh.FixedHostKey(hostkey)
}

func safeCallback(config *ssh.ClientConfig) {
	// ok: avoid-ssh-insecure-ignore-host-key
	config.HostKeyCallback = func(hostname string, remote interface{}, key ssh.PublicKey) error {
		return nil
	}
	_ = config
}

func safeMention() string {
	// ok: avoid-ssh-insecure-ignore-host-key
	return "InsecureIgnoreHostKey in a comment is not a call"
}
