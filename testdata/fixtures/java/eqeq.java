public class EqEq {
    public boolean vuln(String a, String b) {
        // ruleid: eqeq
        if (a == b) {
            return true;
        }
        return false;
    }

    public boolean vulnAgain(String a, String b) {
        // ruleid: eqeq
        return a == b;
    }

    public boolean vulnThird(int x, int y) {
        // ruleid: eqeq
        return x != y;
    }

    public boolean safe(String a, String b) {
        // ok: eqeq
        return a.equals(b);
    }

    public boolean safeObjects(String a, String b) {
        // ok: eqeq
        return java.util.Objects.equals(a, b);
    }

    public boolean plain(int x) {
        // ok: eqeq
        return x > 0;
    }
}
