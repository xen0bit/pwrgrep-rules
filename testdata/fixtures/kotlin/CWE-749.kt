// CWE-749: a WebView hands a Kotlin object to whatever page it happens to be
// showing.
//
// `addJavascriptInterface` exposes every `@JavascriptInterface` method on the
// object to the JavaScript running in the view. That is what it is for, and it
// is only safe while the page is one the app wrote: a redirect, an injected
// script or a man-in-the-middle on a cleartext load puts an attacker on the
// other end of the bridge instead. Before API 17 it was worse still - every
// public method was reachable, `getClass()` included, and one line of
// JavaScript reached Runtime.exec.
package fixture

import android.webkit.WebView

class Docs {

    fun remote(view: WebView, url: String) {
        // ruleid: kotlin-webview-javascript-interface
        view.addJavascriptInterface(Bridge(), "android")
        view.loadUrl(url)
    }

    fun help(view: WebView) {
        // ok: kotlin-webview-javascript-interface
        view.addJavascriptInterface(Bridge(), "android")
        view.loadUrl("file:///android_asset/help/index.html")
    }

    fun plain(view: WebView) {
        // ok: kotlin-webview-javascript-interface
        view.removeJavascriptInterface("android")
    }
}
