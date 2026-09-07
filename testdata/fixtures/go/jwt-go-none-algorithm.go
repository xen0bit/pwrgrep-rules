package fixture

import "github.com/dgrijalva/jwt-go"

func vulnNone() {
	// ruleid: jwt-go-none-algorithm
	token := jwt.NewWithClaims(jwt.SigningMethodNone, jwt.MapClaims{})
	_ = token
}

func vulnNoneAgain() {
	// ruleid: jwt-go-none-algorithm
	_ = jwt.SigningMethodNone
}

func vulnUnsafe() {
	// ruleid: jwt-go-none-algorithm
	_ = jwt.UnsafeAllowNoneSignatureType
}

func safeHS256() {
	// ok: jwt-go-none-algorithm
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	_ = token
}

func safeRS256() {
	// ok: jwt-go-none-algorithm
	_ = jwt.SigningMethodRS256
}

func safeMention() string {
	// ok: jwt-go-none-algorithm
	return "SigningMethodNone in a comment is not use"
}
