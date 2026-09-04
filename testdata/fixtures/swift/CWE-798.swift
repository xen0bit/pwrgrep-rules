// CWE-798: the credential ships inside the .ipa.
//
// An App Store binary is a zip file, and `unzip` plus `strings` is the whole
// of the work - the string pool of the compiled binary holds every literal the
// app was built with. A key written into a `let` is a key that everyone who
// installed the app already has, so rotating it means shipping a release and
// waiting for people to update.
//
// What separates a credential from a name is the value rather than the name.
// `"password"` beside `"host"` is a keyword table; `"API_KEY"` is what the
// value is called somewhere else; `"$(AUTH_TOKEN)"` is a build setting, which
// is the fix.
import Foundation

enum Config {

    // ruleid: swift-credential-is-a-literal
    static let apiKey = "AIzaSyD3vK8pQ2mN7xR1tY9wZ4bC6eF0gH5jL2k"

    // ruleid: swift-credential-is-a-literal
    private let dbPassword = "hunter2"

    // ruleid: swift-credential-is-a-literal
    static let adminSecret: String = "s3cr3t-admin-2019"

    // ruleid: swift-credential-is-a-literal
    var authToken = "ghp_16C7e42F292c6912E7710c838347Ae178B4a"

    // ok: swift-credential-is-a-literal
    static let apiKeyDefaultsName = "com.example.apiKey"

    // ok: swift-credential-is-a-literal
    static let passwordField = "password"

    // ok: swift-credential-is-a-literal
    static let tokenPlaceholder = "$(AUTH_TOKEN)"

    // ok: swift-credential-is-a-literal
    static let apiKey2 = ProcessInfo.processInfo.environment["API_KEY"]

    // ok: swift-credential-is-a-literal
    static let emptyPassword = ""

    // ok: swift-credential-is-a-literal
    static let authBaseURL = "https://api.example.com/v2"

    // ok: swift-credential-is-a-literal
    static let tokenPattern = "^[A-Za-z0-9_-]{16,}$"
}
