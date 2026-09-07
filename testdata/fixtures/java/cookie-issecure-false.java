import javax.servlet.http.Cookie;

public class CookieSecure {
    public void vuln() {
        // ruleid: cookie-issecure-false
        Cookie c = new Cookie("session", "abc");
    }

    public void vulnAgain() {
        // ruleid: cookie-issecure-false
        Cookie c = new Cookie("session", "abc");
    }

    public void vulnThird() {
        // ruleid: cookie-issecure-false
        Cookie c = new Cookie("other", "xyz");
    }

    public void safe() {
        Cookie c = new Cookie("session", "abc");
        // ok: cookie-issecure-false
        c.setSecure(true);
    }

    public void safeAgain() {
        Cookie c = new Cookie("session", "abc");
        // ok: cookie-issecure-false
        c.setSecure(true);
    }

    public void plain() {
        // ok: cookie-issecure-false
        System.out.println("setSecure in a comment is not a call");
    }
}
