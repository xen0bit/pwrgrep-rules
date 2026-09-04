// CWE-939: an exported activity loads whatever URL it is handed.
//
// An activity with an intent filter can be started by any app on the phone, and
// `webView.loadUrl(intent.getStringExtra("url"))` turns it into a browser that
// renders anybody's page inside this app's process. Whatever the WebView is
// configured to allow - JavaScript, a bridge object, access to file:// - it now
// allows to a page the sender chose. A `javascript:` or `file://` URL does not
// even need a server.
package fixture

import android.app.Activity
import android.content.Intent
import android.webkit.WebView

class Browser : Activity() {

    private lateinit var view: WebView

    fun show(intent: Intent) {
        val url = intent.getStringExtra("url")
        // ruleid: kotlin-webview-loads-untrusted-url
        view.loadUrl(url)
    }

    fun deepLink(intent: Intent) {
        // ruleid: kotlin-webview-loads-untrusted-url
        view.loadUrl(intent.dataString)
    }

    fun help() {
        // ok: kotlin-webview-loads-untrusted-url
        view.loadUrl("file:///android_asset/help/index.html")
    }

    fun profile(id: String) {
        // ok: kotlin-webview-loads-untrusted-url
        view.loadUrl("https://example.com/users/" + id)
    }
}
