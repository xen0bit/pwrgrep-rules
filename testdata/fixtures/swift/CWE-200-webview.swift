// CWE-200: a remote page in this web view can read the app's files.
//
// `allowFileAccessFromFileURLs` lets a document loaded from a `file:` URL open
// other `file:` URLs with XMLHttpRequest, and
// `allowUniversalAccessFromFileURLs` drops the same-origin policy for such a
// document entirely - so one line of injected script in a local page reads the
// app's container and posts it anywhere.
//
// Both are undocumented WebKit preferences reached by string, which is why
// they are usually copied from an answer on the internet rather than chosen.
// `loadFileURL(_:allowingReadAccessTo:)` is the supported way to give a local
// page access to exactly the directory it needs.
import Foundation
import WebKit

final class Local {

    func makeLoose() -> WKWebView {
        let config = WKWebViewConfiguration()
        // ruleid: swift-webview-file-access-from-urls
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        // ruleid: swift-webview-file-access-from-urls
        config.preferences.setValue(true, forKey: "allowUniversalAccessFromFileURLs")
        return WKWebView(frame: .zero, configuration: config)
    }

    func makeExplicit() -> WKWebView {
        let config = WKWebViewConfiguration()
        // ruleid: swift-webview-file-access-from-urls
        config.setValue(true, forKey: "allowUniversalAccessFromFileURLs")
        return WKWebView(frame: .zero, configuration: config)
    }

    func makeTight() -> WKWebView {
        let config = WKWebViewConfiguration()
        // ok: swift-webview-file-access-from-urls
        config.preferences.setValue(false, forKey: "allowFileAccessFromFileURLs")
        let view = WKWebView(frame: .zero, configuration: config)
        let help = Bundle.main.url(forResource: "help", withExtension: "html")!
        // ok: swift-webview-file-access-from-urls
        view.loadFileURL(help, allowingReadAccessTo: help.deletingLastPathComponent())
        return view
    }
}
