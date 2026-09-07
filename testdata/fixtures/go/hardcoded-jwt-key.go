package fixture

import (
	"github.com/dgrijalva/jwt-go"
	"os"
)

func vulnLiteral() string {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	// ruleid: hardcoded-jwt-key
	signed, _ := token.SignedString([]byte("hardcoded-secret"))
	return signed
}

func vulnLiteralAgain() string {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	// ruleid: hardcoded-jwt-key
	signed, _ := token.SignedString([]byte("another-hardcoded-secret"))
	return signed
}

func vulnLiteralThird() string {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	// ruleid: hardcoded-jwt-key
	signed, _ := token.SignedString([]byte("yet-another-secret"))
	return signed
}

func safeFromEnv() string {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	// ok: hardcoded-jwt-key
	signed, _ := token.SignedString([]byte(os.Getenv("JWT_KEY")))
	return signed
}

func safeParam(key []byte) string {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	// ok: hardcoded-jwt-key
	signed, _ := token.SignedString(key)
	return signed
}

func safeNoSign() string {
	// ok: hardcoded-jwt-key
	return "SignedString in a comment is not a call"
}
