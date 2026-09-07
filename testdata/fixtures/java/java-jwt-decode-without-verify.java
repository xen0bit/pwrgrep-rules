import com.auth0.jwt.JWT;

public class JwtDecode {
    public void parseUnverified(String token) {
        // ruleid: java-jwt-decode-without-verify
        com.auth0.jwt.JWT.decode(token);
    }

    public void parseAgain(String token) {
        // ruleid: java-jwt-decode-without-verify
        com.auth0.jwt.JWT.decode(token);
    }

    public void parseThird(String token) {
        // ruleid: java-jwt-decode-without-verify
        com.auth0.jwt.JWT.decode(token);
    }

    public void parseVerified(String token, com.auth0.jwt.JWTVerifier verifier) {
        // ok: java-jwt-decode-without-verify
        verifier.verify(token);
    }

    public void noDecode(String token) {
        // ok: java-jwt-decode-without-verify
        System.out.println(token);
    }

    public void plainHelper() {
        // ok: java-jwt-decode-without-verify
        System.out.println("decode in a comment is not a call");
    }
}
