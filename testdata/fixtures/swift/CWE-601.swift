// CWE-601: the web view goes wherever the deep link says.
//
// An app that registers a URL scheme or a universal link accepts a URL from
// any other app and from any web page. Handing that URL to a web view means
// whoever sent it chooses the page - and the page is inside the app's own
// chrome, sharing its web view's cookies, next to its script message handlers
// and behind whatever the user believes the app to be.
//
// The check is an allowlist of hosts, compared after the URL is parsed. There
// is no way to spell it as a call, which is why this rule reports where the
// URL is loaded and says so.
import Foundation
import WebKit

final class Router {

    let view = WKWebView()

    func openFromDeepLink(_ url: URL) {
        guard let target = URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?.first(where: { $0.name == "next" })?.value else { return }
        // ruleid: swift-webview-loads-untrusted-url
        view.load(URLRequest(url: URL(string: target)!))
    }

    func openFragment(_ url: URL) {
        let target = url.fragment ?? ""
        // ruleid: swift-webview-loads-untrusted-url
        view.load(URLRequest(url: URL(string: target)!))
    }

    func openHome() {
        // ok: swift-webview-loads-untrusted-url
        view.load(URLRequest(url: URL(string: "https://app.example.com/home")!))
    }

    func openAllowed(_ url: URL) {
        let target = url.fragment ?? ""
        guard let parsed = URL(string: target), parsed.host == "app.example.com" else { return }
        // ok: swift-webview-loads-untrusted-url
        view.load(URLRequest(url: parsed))
    }
}
