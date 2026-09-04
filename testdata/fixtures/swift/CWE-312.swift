// CWE-312: the secret is in a plist, in the clear.
//
// UserDefaults is a property list in the app's Library/Preferences directory.
// It is not encrypted beyond the file-level protection every file gets, it is
// included in an unencrypted iTunes/Finder backup, and on a jailbroken device
// it is a `cat` away. It is the right place for whether the user prefers dark
// mode and the wrong place for anything that would let somebody else be them.
//
// The keychain is the place for that: it is hardware-backed, it has a
// protection class, and it survives reinstalls only if you ask it to.
import Foundation
import SwiftUI

final class Session {

    let defaults = UserDefaults.standard

    func store(token: String, password: String, theme: String) {
        // ruleid: swift-credential-in-user-defaults
        UserDefaults.standard.set(token, forKey: "authToken")

        // ruleid: swift-credential-in-user-defaults
        defaults.set(password, forKey: "userPassword")

        // ruleid: swift-credential-in-user-defaults
        UserDefaults(suiteName: "group.example")?.set(token, forKey: "api_key")

        // ok: swift-credential-in-user-defaults
        UserDefaults.standard.set(theme, forKey: "preferredTheme")

        // ok: swift-credential-in-user-defaults
        defaults.set(true, forKey: "hasSeenOnboarding")
    }

    // ruleid: swift-credential-in-user-defaults
    @AppStorage("sessionToken") var sessionToken: String = ""

    // ok: swift-credential-in-user-defaults
    @AppStorage("lastOpenedTab") var lastOpenedTab: Int = 0
}
