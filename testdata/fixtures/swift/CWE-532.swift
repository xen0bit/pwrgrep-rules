// CWE-532: the secret ends up in a log the app does not own.
//
// `print` and `NSLog` write to the unified log, which is not a developer-only
// place: it is collected into sysdiagnose bundles the user is asked to send to
// support, it is visible in Console.app to anyone with the phone plugged in
// and trusted, and on a shared Mac it is readable in the simulator's log by
// every account. A token written there has a lifetime the app does not
// control.
//
// The whole difficulty is telling a secret from a message about one.
// `print("password rejected")` is a sentence with the word in it;
// `print(password)` is the password. What separates them is that the second
// carries a *value* - a bare name, or a `\(...)` interpolation - and the first
// is only letters.
import Foundation
import os

func audit(user: String, password: String, sessionToken: String) {

    // ruleid: swift-sensitive-value-logged
    print(password)

    // ruleid: swift-sensitive-value-logged
    print("auth token: \(sessionToken)")

    // ruleid: swift-sensitive-value-logged
    NSLog("password for %@ is \(password)", user)

    // ruleid: swift-sensitive-value-logged
    debugPrint(sessionToken)

    // ok: swift-sensitive-value-logged
    print("password rejected")

    // ok: swift-sensitive-value-logged
    print("signing in \(user)")

    // ok: swift-sensitive-value-logged
    NSLog("token endpoint unreachable")

    // ok: swift-sensitive-value-logged
    print(user)
}
