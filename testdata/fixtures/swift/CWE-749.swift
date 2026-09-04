// CWE-749: the page can call into the app.
//
// `WKUserContentController.add(_:name:)` installs a handler reachable from
// JavaScript as `window.webkit.messageHandlers.<name>.postMessage(...)`. Every
// frame in that web view can call it, including an iframe or a redirect the
// app never chose, so whatever the handler does it does on behalf of whoever
// wrote the page that is loaded.
//
// The bridge is fine where the app decides what is loaded. A web view showing
// HTML out of the app's own bundle can only ever run the app's own script, so
// a method that names `Bundle.main` is left alone - which also leaves alone a
// method that loads a bundled page *and* a remote one, and that is coarse in
// the quiet direction.
import Foundation
import WebKit

final class BridgedView: NSObject, WKScriptMessageHandler {

    func makeRemote() -> WKWebView {
        let config = WKWebViewConfiguration()
        // ruleid: swift-webview-javascript-bridge
        config.userContentController.add(self, name: "native")
        let view = WKWebView(frame: .zero, configuration: config)
        view.load(URLRequest(url: URL(string: "https://partner.example.com")!))
        return view
    }

    func makeRemoteNested() -> WKWebView {
        let view = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        // ruleid: swift-webview-javascript-bridge
        view.configuration.userContentController.add(self, name: "bridge")
        return view
    }

    func makeBundled() -> WKWebView {
        let config = WKWebViewConfiguration()
        // ok: swift-webview-javascript-bridge
        config.userContentController.add(self, name: "native")
        let view = WKWebView(frame: .zero, configuration: config)
        let help = Bundle.main.url(forResource: "help", withExtension: "html")!
        view.loadFileURL(help, allowingReadAccessTo: help.deletingLastPathComponent())
        return view
    }

    func removeIt(_ config: WKWebViewConfiguration) {
        // ok: swift-webview-javascript-bridge
        config.userContentController.removeScriptMessageHandler(forName: "native")
    }

    func userContentController(_ controller: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        print(message.body)
    }
}
