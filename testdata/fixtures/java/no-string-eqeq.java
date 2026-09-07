// Comparing strings with `==` compares references, not contents. The rule is
// textual: it looks for an equality against a parenthesized String type, so
// the flagged lines keep that exact odd shape. `.equals` (and plain `==`) is fine.
public class NoStringEqeq {
    void flag(String a, String b) {
        // ruleid: no-string-eqeq
        if (a == (String b)) {
            System.out.println("eq");
        }
    }

    void flagAgain(String first, String second) {
        // ruleid: no-string-eqeq
        if (first == (String second)) {
            System.out.println("eq");
        }
    }

    void flagThird(String x, String y) {
        // ruleid: no-string-eqeq
        while (x == (String y)) {
            System.out.println("eq");
        }
    }

    void safeEquals(String a, String b) {
        // ok: no-string-eqeq
        if (a.equals(b)) {
            System.out.println("eq");
        }
    }

    void safePlain(String a, String b) {
        // ok: no-string-eqeq
        if (a == b) {
            System.out.println("eq");
        }
    }

    void safeNull(String a) {
        // ok: no-string-eqeq
        if (null == a) {
            System.out.println("eq");
        }
    }
}
