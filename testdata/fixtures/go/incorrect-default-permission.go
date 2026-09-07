package fixture

import (
	"io/ioutil"
	"os"
)

func vulnWriteFile(name string, data []byte) error {
	// ruleid: incorrect-default-permission
	return ioutil.WriteFile(name, data, 0755)
}

func vulnChmod(name string) error {
	// ruleid: incorrect-default-permission
	return os.Chmod(name, 0777)
}

func vulnMkdir(name string) error {
	// ruleid: incorrect-default-permission
	return os.Mkdir(name, 0755)
}

func vulnMkdirAll(name string) error {
	// ruleid: incorrect-default-permission
	return os.MkdirAll(name, 0755)
}

func vulnOpenFile(name string) (*os.File, error) {
	// ruleid: incorrect-default-permission
	return os.OpenFile(name, os.O_CREATE|os.O_RDWR, 0644)
}

func safeWriteFile(name string, data []byte) error {
	// ok: incorrect-default-permission
	return ioutil.WriteFile(name, data, 0600)
}

func safeChmod(name string) error {
	// ok: incorrect-default-permission
	return os.Chmod(name, 0600)
}

func safeMkdir(name string) error {
	// ok: incorrect-default-permission
	return os.Mkdir(name, 0500)
}

func safeOpenFile(name string) (*os.File, error) {
	// ok: incorrect-default-permission
	return os.OpenFile(name, os.O_CREATE|os.O_RDWR, 0600)
}
