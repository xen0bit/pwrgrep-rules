import javax.servlet.http.Cookie;

public class CookieSetSecure {
    public void vuln() {
        Cookie broken = new Cookie("session", "abc");
        // ruleid: cookie-setSecure
        broken.setSecure(false);
    }

    public void vulnAgain() {
        Cookie broken2 = new Cookie("session", "abc");
        // ruleid: cookie-setSecure
        broken2.setSecure(false);
    }

    public void vulnThird() {
        Cookie broken3 = new Cookie("session", "abc");
        // ruleid: cookie-setSecure
        broken3.setSecure(false);
    }

    public void safe() {
        Cookie fine = new Cookie("session", "abc");
        // ok: cookie-setSecure
        fine.setSecure(true);
    }

    public void safeAgain() {
        Cookie fine2 = new Cookie("session", "abc");
        // ok: cookie-setSecure
        fine2.setSecure(true);
    }

    public void plain() {
        // ok: cookie-setSecure
        System.out.println("setSecure in a comment is not a call");
    }
}
