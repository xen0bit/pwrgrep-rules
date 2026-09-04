// CWE-200: the secret goes on the system pasteboard.
//
// `UIPasteboard.general` is shared by every app on the device. Any app the
// user opens next can read it without a prompt and without an entitlement, and
// with Universal Clipboard on it is also on their Mac and their iPad within
// seconds. Before iOS 16 there was not even a paste notification.
//
// A password manager copying a password is the case the API is for, and it is
// also exactly the case that has been abused - which is why `expirationDate`
// and `localOnly` exist. A pasteboard write with neither is a secret left
// where the next app finds it.
import Foundation
import UIKit

final class Share {

    func copyCredentials(password: String, apiToken: String, note: String) {
        // ruleid: swift-secret-on-general-pasteboard
        UIPasteboard.general.string = password

        // ruleid: swift-secret-on-general-pasteboard
        UIPasteboard.general.setValue(apiToken, forPasteboardType: "public.text")

        // ok: swift-secret-on-general-pasteboard
        UIPasteboard.general.string = note

        // ok: swift-secret-on-general-pasteboard
        UIPasteboard.general.setItems([["public.text": password]],
                                      options: [.localOnly: true,
                                                .expirationDate: Date().addingTimeInterval(60)])
    }

    // ok: swift-secret-on-general-pasteboard
    static let pasteboardNote = "the password is copied for 60 seconds"
}
