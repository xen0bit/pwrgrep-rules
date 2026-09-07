// A hard-coded HMAC secret means anyone reading the code can forge tokens.
// The rule is textual: it looks for a parenthesized `(Algorithm name)` tied
// to an `HMAC...("literal")` call, so the flagged lines keep that exact odd
// shape; a secret drawn from configuration is fine. Findings land on the
// assignment line.
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

public class JwtHardcode {
    public String flag() {
        // ruleid: java-jwt-hardcoded-secret
        (Algorithm alg) = Algorithm.HMAC256("secret");
        return JWT.create().sign(alg);
    }

    public String flag512() {
        // ruleid: java-jwt-hardcoded-secret
        (Algorithm alg) = Algorithm.HMAC512("topsecret");
        return JWT.create().sign(alg);
    }

    public String flag384() {
        // ruleid: java-jwt-hardcoded-secret
        (Algorithm alg) = Algorithm.HMAC384("anothersecret");
        return JWT.create().sign(alg);
    }

    public String safeConfig(String secret) {
        // ok: java-jwt-hardcoded-secret
        Algorithm alg = Algorithm.HMAC256(secret);
        return JWT.create().sign(alg);
    }

    public String safeEnv() {
        // ok: java-jwt-hardcoded-secret
        Algorithm alg = Algorithm.HMAC256(System.getenv("JWT_SECRET"));
        return JWT.create().sign(alg);
    }

    public String safeRsa(java.security.interfaces.RSAPublicKey key) {
        // ok: java-jwt-hardcoded-secret
        Algorithm alg = Algorithm.RSA256(key);
        return JWT.create().sign(alg);
    }
}
