package fixture

import "github.com/dgrijalva/jwt-go"

func vulnParse(tokenString string, p *jwt.Parser) {
	// ruleid: jwt-go-parse-unverified
	token, _ := p.ParseUnverified(tokenString, jwt.MapClaims{})
	_ = token
}

func vulnParseAgain(tokenString string, p *jwt.Parser) {
	// ruleid: jwt-go-parse-unverified
	token, _ := p.ParseUnverified(tokenString, jwt.MapClaims{})
	_ = token
}

func vulnParseThird(tokenString string, p *jwt.Parser) {
	// ruleid: jwt-go-parse-unverified
	token, parts, _ := p.ParseUnverified(tokenString, jwt.MapClaims{})
	_, _ = token, parts
}

func safeParse(tokenString string, key []byte) {
	// ok: jwt-go-parse-unverified
	token, _ := jwt.Parse(tokenString, func(t *jwt.Token) (interface{}, error) {
		return key, nil
	})
	_ = token
}

func safeParseAgain(tokenString string, key []byte) {
	// ok: jwt-go-parse-unverified
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{})
	_ = token
	_ = tokenString
	_ = key
}

func safeNoParse(tokenString string) string {
	// ok: jwt-go-parse-unverified
	return "ParseUnverified in a comment is not a call"
}
