import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieHttpOnly {
    public void vuln(HttpServletResponse response) {
        Cookie c = new Cookie("session", "abc");
        // ruleid: cookie-missing-httponly
        response.addCookie(c);
    }

    public void vulnAgain(HttpServletResponse response) {
        Cookie c = new Cookie("session", "abc");
        // ruleid: cookie-missing-httponly
        response.addCookie(c);
    }

    public void vulnThird(HttpServletResponse response) {
        Cookie c = new Cookie("other", "xyz");
        // ruleid: cookie-missing-httponly
        response.addCookie(c);
    }

    public void safe(String name) {
        // ok: cookie-missing-httponly
        System.out.println(name);
    }

    public void plain() {
        // ok: cookie-missing-httponly
        System.out.println("addCookie in a comment is not a call");
    }

    public void nocookie(String name) {
        // ok: cookie-missing-httponly
        System.out.println(name);
    }
}
