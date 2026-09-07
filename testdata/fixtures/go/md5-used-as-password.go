package fixture

import (
	"crypto/md5"
	"crypto/sha256"
	"fmt"
)

func vulnNew(pw string) string {
	h := md5.New()
	h.Write([]byte(pw))
	hex := fmt.Sprintf("%x", h.Sum(nil))
	// ruleid: md5-used-as-password
	return savePassword(hex)
}

func vulnSum(pw string) string {
	sum := md5.Sum([]byte(pw))
	hex := fmt.Sprintf("%x", sum)
	// ruleid: md5-used-as-password
	return updatePassword(hex)
}

func vulnDirect(pw string) string {
	h := md5.New()
	h.Write([]byte(pw))
	// ruleid: md5-used-as-password
	return savePassword(fmt.Sprintf("%x", h.Sum(nil)))
}

func safeSha256(pw string) string {
	h := sha256.New()
	h.Write([]byte(pw))
	hex := fmt.Sprintf("%x", h.Sum(nil))
	// ok: md5-used-as-password
	return savePassword(hex)
}

func safeNoPassword(data []byte) string {
	h := md5.New()
	h.Write(data)
	// ok: md5-used-as-password
	return fmt.Sprintf("%x", h.Sum(nil))
}

func safeConstant() string {
	// ok: md5-used-as-password
	return savePassword("changeme")
}
