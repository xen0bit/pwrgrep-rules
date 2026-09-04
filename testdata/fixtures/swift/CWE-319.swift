// CWE-319: the request goes out in the clear.
//
// A phone is on somebody else's network almost all the time - a café access
// point, a captive portal, a carrier's transparent proxy - and every one of
// them can read a cleartext request. The half people forget is the other
// direction: whoever can read it can also rewrite the reply, so this is a way
// to feed the app whatever the network decides to say.
//
// App Transport Security blocks this by default, which means an app doing it
// has an `NSAllowsArbitraryLoads` in its Info.plist to match - two findings
// for one decision, and both worth having.
import Foundation

enum API {

    // ruleid: swift-cleartext-http-url
    static let base = URL(string: "http://api.example.com/v1")!

    static func fetch(_ session: URLSession) {
        // ruleid: swift-cleartext-http-url
        var request = URLRequest(url: URL(string: "http://api.example.com/login")!)
        request.httpMethod = "POST"
        session.dataTask(with: request).resume()
    }

    static func components() -> URLComponents? {
        // ruleid: swift-cleartext-http-url
        return URLComponents(string: "http://metrics.example.com/collect")
    }

    static func secure() {
        // ok: swift-cleartext-http-url
        _ = URL(string: "https://api.example.com/v1")
    }

    static func loopback() {
        // ok: swift-cleartext-http-url
        _ = URL(string: "http://localhost:8080/health")
        // ok: swift-cleartext-http-url
        _ = URL(string: "http://127.0.0.1:9000/debug")
    }

    // ok: swift-cleartext-http-url
    static let xmlNamespace = "http://www.w3.org/2000/svg"
}
