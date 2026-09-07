import javax.servlet.http.HttpServletResponse;

public class UnvalidatedRedirect {
    // ruleid: unvalidated-redirect
    public void go(HttpServletResponse response, String url) {
        response.sendRedirect(url);
    }

    // ruleid: unvalidated-redirect
    public void away(HttpServletResponse response, String dest) {
        response.sendRedirect(dest);
    }

    // ruleid: unvalidated-redirect
    public void out(HttpServletResponse response, String target) {
        response.sendRedirect(target);
    }

    // ok: unvalidated-redirect
    public void home(HttpServletResponse response) {
        response.sendRedirect("/home");
    }

    // ok: unvalidated-redirect
    public void fixed(HttpServletResponse response) {
        response.sendRedirect("/fixed");
    }

    // ok: unvalidated-redirect
    public void plain(String url) {
        System.out.println(url);
    }
}
