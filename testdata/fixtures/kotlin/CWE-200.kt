// CWE-200: a WebView is told that a page loaded from a file may read every
// other file.
//
// `allowFileAccessFromFileURLs` and `allowUniversalAccessFromFileURLs` are
// both false by default, and for good reason. With either on, a page opened
// from `file://` - which includes anything an attacker can get written to
// external storage or into the download directory - can use XMLHttpRequest to
// read the app's own private files and send them anywhere. The same-origin
// policy is the only thing standing between the two, and these switches turn
// it off for the origin every downloaded file shares.
package fixture

import android.webkit.WebView

class Viewer {

    fun open(view: WebView) {
        // ruleid: kotlin-webview-file-access-from-urls
        view.settings.allowUniversalAccessFromFileURLs = true

        // ruleid: kotlin-webview-file-access-from-urls
        view.settings.setAllowFileAccessFromFileURLs(true)
    }

    fun closed(view: WebView) {
        // ok: kotlin-webview-file-access-from-urls
        view.settings.allowUniversalAccessFromFileURLs = false

        // ok: kotlin-webview-file-access-from-urls
        view.settings.javaScriptEnabled = true

        // ok: kotlin-webview-file-access-from-urls
        view.settings.setAllowFileAccess(false)
    }
}
