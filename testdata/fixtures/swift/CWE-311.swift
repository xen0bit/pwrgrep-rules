// CWE-311: the keychain item is readable while the phone is locked.
//
// The keychain's protection class decides when the item can be decrypted.
// `kSecAttrAccessibleAlways` means "whenever the device is on", which
// includes while it is locked in somebody else's hand and while it is being
// restored from a backup - so the item is no longer protected by the
// passcode, which is the only thing protecting it.
//
// Apple deprecated both `Always` spellings in iOS 12 for this reason. The
// default, `kSecAttrAccessibleWhenUnlocked`, needs the passcode; the
// `...ThisDeviceOnly` variants additionally keep the item out of backups.
import Foundation
import Security

enum Store {

    static func save(_ token: Data) {
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "session",
            // ruleid: swift-keychain-readable-when-locked
            kSecAttrAccessible as String: kSecAttrAccessibleAlways,
            kSecValueData as String: token
        ]
        SecItemAdd(query as CFDictionary, nil)
        query.removeAll()
    }

    static func saveDeviceOnly(_ token: Data) {
        var query: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        // ruleid: swift-keychain-readable-when-locked
        query[kSecAttrAccessible as String] = kSecAttrAccessibleAlwaysThisDeviceOnly
        query[kSecValueData as String] = token
        SecItemAdd(query as CFDictionary, nil)
    }

    static func saveWhenUnlocked(_ token: Data) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            // ok: swift-keychain-readable-when-locked
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
            kSecValueData as String: token
        ]
        SecItemAdd(query as CFDictionary, nil)
    }

    static func saveAfterFirstUnlock(_ token: Data) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            // ok: swift-keychain-readable-when-locked
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock,
            kSecValueData as String: token
        ]
        SecItemAdd(query as CFDictionary, nil)
    }

    // ok: swift-keychain-readable-when-locked
    static let accessibleNote = "kSecAttrAccessibleAlways was deprecated in iOS 12"
}
