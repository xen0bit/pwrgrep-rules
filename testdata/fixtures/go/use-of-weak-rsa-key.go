package fixture

import (
	"crypto/rand"
	"crypto/rsa"
)

func vuln1024() (*rsa.PrivateKey, error) {
	// ruleid: use-of-weak-rsa-key
	return rsa.GenerateKey(rand.Reader, 1024)
}

func vuln512() (*rsa.PrivateKey, error) {
	// ruleid: use-of-weak-rsa-key
	return rsa.GenerateKey(rand.Reader, 512)
}

func vuln1024Multi() (*rsa.PrivateKey, error) {
	// ruleid: use-of-weak-rsa-key
	return rsa.GenerateKey(rand.Reader, 1024)
}

func safe2048() (*rsa.PrivateKey, error) {
	// ok: use-of-weak-rsa-key
	return rsa.GenerateKey(rand.Reader, 2048)
}

func safe4096() (*rsa.PrivateKey, error) {
	// ok: use-of-weak-rsa-key
	return rsa.GenerateKey(rand.Reader, 4096)
}

func safeMention() string {
	// ok: use-of-weak-rsa-key
	return "GenerateKey in a comment is not a call"
}
