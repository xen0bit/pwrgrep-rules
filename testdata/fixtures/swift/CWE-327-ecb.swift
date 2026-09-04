// CWE-327: ECB encrypts equal blocks to equal ciphertext.
//
// Electronic Codebook has no chaining and no IV, so every sixteen-byte block
// is enciphered on its own. Two identical plaintext blocks produce two
// identical ciphertext blocks, which means the ciphertext carries the shape of
// the plaintext through it - the reason the ECB penguin is the standard
// picture of this - and it means an attacker can cut and paste blocks between
// messages without the key.
//
// `kCCOptionECBMode` is the CommonCrypto spelling and it is opt-in: leaving
// the options at zero gives CBC with the IV you pass, which is the default for
// a reason.
import Foundation
import CommonCrypto

enum Crypt {

    static func seal(_ data: Data, key: Data, out: UnsafeMutableRawPointer) {
        var moved = 0
        _ = CCCrypt(CCOperation(kCCEncrypt), CCAlgorithm(kCCAlgorithmAES),
                    // ruleid: swift-ecb-cipher
                    CCOptions(kCCOptionECBMode | kCCOptionPKCS7Padding),
                    nil, key.count, nil, nil, data.count, out, data.count, &moved)
    }

    static func sealWithPlainOption(_ data: Data, out: UnsafeMutableRawPointer) {
        var moved = 0
        _ = CCCrypt(CCOperation(kCCEncrypt), CCAlgorithm(kCCAlgorithmAES),
                    // ruleid: swift-ecb-cipher
                    CCOptions(kCCOptionECBMode),
                    nil, 32, nil, nil, data.count, out, data.count, &moved)
    }

    static func sealCBC(_ data: Data, iv: Data, out: UnsafeMutableRawPointer) {
        var moved = 0
        _ = CCCrypt(CCOperation(kCCEncrypt), CCAlgorithm(kCCAlgorithmAES),
                    // ok: swift-ecb-cipher
                    CCOptions(kCCOptionPKCS7Padding),
                    nil, 32, nil, nil, data.count, out, data.count, &moved)
    }

    // ok: swift-ecb-cipher
    static let modeNote = "kCCOptionECBMode is what we removed in 2019"
}
