import java.security.*;

public class DoPrivilegedUse {
    public void vuln() {
        // ruleid: do-privileged-use
        AccessController.doPrivileged(null);
    }

    public void vulnAgain() {
        // ruleid: do-privileged-use
        AccessController.doPrivileged(null);
    }

    public void vulnThird() {
        // ruleid: do-privileged-use
        AccessController.doPrivileged(null);
    }

    public void safe() {
        // ok: do-privileged-use
        System.out.println("nothing privileged here");
    }

    public void safeAgain() {
        // ok: do-privileged-use
        int x = 1 + 1;
    }

    public void plain() {
        // ok: do-privileged-use
        String s = "doPrivileged in a string is not a call";
    }
}
