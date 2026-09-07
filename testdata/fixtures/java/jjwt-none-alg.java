import io.jsonwebtoken.Jwts;

public class JjwtNone {
    public String unsigned() {
        // ruleid: jjwt-none-alg
        return Jwts.builder().setSubject("a").compact();
    }

    public String unsignedAgain() {
        // ruleid: jjwt-none-alg
        return Jwts.builder().setSubject("b").compact();
    }

    public String unsignedThird() {
        // ruleid: jjwt-none-alg
        return Jwts.builder().setIssuer("x").compact();
    }

    public String signed(javax.crypto.SecretKey key) {
        // ok: jjwt-none-alg
        return Jwts.builder().setSubject("a").signWith(key).compact();
    }

    public String signedAgain(javax.crypto.SecretKey key) {
        // ok: jjwt-none-alg
        return Jwts.builder().setSubject("b").signWith(key).compact();
    }

    public String noBuilder() {
        // ok: jjwt-none-alg
        return "builder in a comment is not a call";
    }
}
