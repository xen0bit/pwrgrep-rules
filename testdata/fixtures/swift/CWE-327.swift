// CWE-327: the hash is one an attacker can produce a collision for.
//
// CryptoKit spells it out - the type is called `Insecure` - and CommonCrypto's
// `CC_MD5` and `CC_SHA1` are the same functions under an older name. Neither
// is safe for a signature, a password, a token or an integrity check; SHA-256
// is a one-word change.
//
// A checksum against accidental corruption is a real use, and the rule reports
// it anyway. Nothing in the syntax says which this is, and the reader can tell
// in a second where a rule cannot.
import Foundation
import CryptoKit
import CommonCrypto

enum Digest {

    static func fingerprint(_ data: Data) -> String {
        // ruleid: swift-weak-hash
        let md5 = Insecure.MD5.hash(data: data)
        return md5.map { String(format: "%02x", $0) }.joined()
    }

    static func legacy(_ data: Data) -> Data {
        // ruleid: swift-weak-hash
        let sha1 = Insecure.SHA1.hash(data: data)
        return Data(sha1)
    }

    static func commonCrypto(_ bytes: UnsafeRawPointer, _ len: CC_LONG, _ out: UnsafeMutablePointer<UInt8>) {
        // ruleid: swift-weak-hash
        CC_MD5(bytes, len, out)
        // ruleid: swift-weak-hash
        CC_SHA1(bytes, len, out)
    }

    static func strong(_ data: Data) -> Data {
        // ok: swift-weak-hash
        let digest = SHA256.hash(data: data)
        return Data(digest)
    }

    static func stronger(_ data: Data) -> Data {
        // ok: swift-weak-hash
        let digest = SHA512.hash(data: data)
        return Data(digest)
    }

    // ok: swift-weak-hash
    static let algorithmNote = "MD5 and SHA1 are not collision resistant"
}
