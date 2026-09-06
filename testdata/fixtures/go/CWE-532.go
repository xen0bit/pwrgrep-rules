// CWE-532: Insertion of Sensitive Information into Log File
//
// Logging a password or secret exposes it in log files which are often
// world-readable or shipped to third parties.

package fixture

import (
	"log"
	"os"
)

func leak() {
	password := os.Getenv("PASSWORD")
	secret := os.Getenv("SECRET")
	// ruleid: go-sensitive-log
	log.Println(password)
	// ruleid: go-sensitive-log
	log.Printf("password=%s", password)
	// ruleid: go-sensitive-log
	log.Println(secret)
}

func safe() {
	// ok: go-sensitive-log
	log.Println("user logged in")
	// ok: go-sensitive-log
	log.Printf("request processed")
	// ok: go-sensitive-log
	log.Println("redacted")
}
