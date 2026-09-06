// CWE-79: XSS via WebView
package fixture
import android.webkit.WebView
class Test79 {
    fun vuln(view: WebView, user: String) {
        // ruleid: kotlin-xss
        view.loadData(user, "text/html", null)
        // ruleid: kotlin-xss
        view.loadDataWithBaseURL(null, user, "text/html", null, null)
    }
    fun safe(view: WebView) {
        // ok: kotlin-xss
        view.loadData("<p>hello</p>", "text/html", null)
        // ok: kotlin-xss
        view.loadDataWithBaseURL(null, "<b>fixed</b>", "text/html", null, null)
    }
    fun vulnExtra(view: WebView, input: String) {
        // ruleid: kotlin-xss
        view.loadData(input, "text/html", "utf-8")
    }
    fun vulnBase(view: WebView, html: String) {
        // ruleid: kotlin-xss
        view.loadDataWithBaseURL("https://example.com", html, "text/html", "utf-8", null)
    }
    fun safeLiteral(view: WebView) {
        // ok: kotlin-xss
        view.loadData("<html><body>safe</body></html>", "text/html", null)
    }
}
