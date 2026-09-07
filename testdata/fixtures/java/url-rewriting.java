import javax.servlet.http.HttpServletResponse;

public class UrlRewriting {
    public void vuln(HttpServletResponse response, String url) {
        // ruleid: url-rewriting
        response.encodeURL(url);
    }

    public void vulnAgain(HttpServletResponse response, String url) {
        // ruleid: url-rewriting
        response.encodeRedirectURL(url);
    }

    public void vulnThird(HttpServletResponse response, String url) {
        // ruleid: url-rewriting
        response.encodeUrl(url);
    }

    public void safe(HttpServletResponse response, String url) {
        // ok: url-rewriting
        response.sendRedirect(url);
    }

    public void plain(String url) {
        // ok: url-rewriting
        System.out.println(url);
    }

    public void helper() {
        // ok: url-rewriting
        System.out.println("encodeURL in a comment is not a call");
    }
}
