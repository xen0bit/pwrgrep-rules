public class HardcodedCond {
    public boolean vuln() {
        // ruleid: hardcoded-conditional
        if (true) {
            return true;
        }
        return false;
    }

    public boolean vulnAgain() {
        // ruleid: hardcoded-conditional
        if (false) {
            return true;
        }
        return false;
    }

    public boolean vulnThird(boolean flag) {
        // ruleid: hardcoded-conditional
        if (flag || true) {
            return true;
        }
        return false;
    }

    public boolean safe(boolean flag) {
        // ok: hardcoded-conditional
        if (flag) {
            return true;
        }
        return false;
    }

    public boolean safeAgain(boolean flag) {
        // ok: hardcoded-conditional
        if (flag && true) {
            return true;
        }
        return false;
    }

    public boolean plain() {
        // ok: hardcoded-conditional
        return true;
    }
}
