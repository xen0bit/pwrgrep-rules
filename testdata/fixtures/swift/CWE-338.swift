// CWE-338: the token is guessable.
//
// `Int.random(in:)` and `arc4random_uniform` draw from a generator that is
// fast and uniform and makes no promise about being unpredictable.
// `SystemRandomNumberGenerator` is documented as suitable for general use and
// explicitly not guaranteed to be cryptographically secure - Apple says so in
// the type's own documentation.
//
// For a shuffle, a jitter or a colour that is exactly right. For anything an
// attacker would like to guess - a session token, a nonce, an IV, a password
// reset code - it is the whole of the vulnerability, and
// `SecRandomCopyBytes` is the same amount of code.
//
// So the rule reports a draw whose *result* is named as a secret, and leaves
// every other draw alone. A rule that reported them all would be a rule
// nobody keeps switched on.
import Foundation

enum Tokens {

    // ruleid: swift-insecure-random-for-secret
    static let sessionToken = String(Int.random(in: 0..<999999))

    static func makeNonce() -> UInt32 {
        // ruleid: swift-insecure-random-for-secret
        let nonce = arc4random_uniform(1 << 31)
        return nonce
    }

    static func makeResetCode() -> Int {
        // ruleid: swift-insecure-random-for-secret
        let otpSecret = Int.random(in: 100000..<999999)
        return otpSecret
    }

    static func shuffleDeck(_ cards: [Int]) -> [Int] {
        // ok: swift-insecure-random-for-secret
        let picked = cards.randomElement()
        return [picked ?? 0]
    }

    static func jitter() -> Double {
        // ok: swift-insecure-random-for-secret
        let delay = Double.random(in: 0..<0.5)
        return delay
    }

    static func makeSecureToken() -> Data {
        var bytes = [UInt8](repeating: 0, count: 32)
        // ok: swift-insecure-random-for-secret
        _ = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
        return Data(bytes)
    }
}
