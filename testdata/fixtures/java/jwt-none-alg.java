// Signing with `Algorithm.none()` produces tokens with no signature at all.
// Flag both the inline and the stored-algorithm shapes; real algorithms
// are fine.
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

public class JwtNoneAlg {
    public String flag() {
        // ruleid: java-jwt-none-alg
        return JWT.create().sign(com.auth0.jwt.algorithms.Algorithm.none());
    }

    public String flagStored() {
        // ruleid: java-jwt-none-alg
        Algorithm none = com.auth0.jwt.algorithms.Algorithm.none();
        return JWT.create().sign(none);
    }

    public String flagAgain() {
        // ruleid: java-jwt-none-alg
        return JWT.create().sign(com.auth0.jwt.algorithms.Algorithm.none());
    }

    public String safeHmac(String secret) {
        Algorithm alg = Algorithm.HMAC256(secret);
        // ok: java-jwt-none-alg
        return JWT.create().sign(alg);
    }

    public String safeRsa(java.security.interfaces.RSAPublicKey key) {
        Algorithm alg = Algorithm.RSA256(key);
        // ok: java-jwt-none-alg
        return JWT.create().sign(alg);
    }

    public String safeDirect(String secret) {
        // ok: java-jwt-none-alg
        return JWT.create().sign(Algorithm.HMAC256(secret));
    }
}
