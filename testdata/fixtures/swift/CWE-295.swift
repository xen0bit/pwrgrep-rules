// CWE-295: the app answers the TLS challenge with "yes".
//
// `URLCredential(trust:)` wraps the certificate chain the server just sent and
// hands it back as the credential to proceed with. Built from the challenge's
// own `serverTrust` and passed to the completion handler without evaluating
// it first, that is the whole of the check - the app will talk to anybody
// holding any certificate, which is every coffee-shop proxy there is.
//
// The safe spelling calls `SecTrustEvaluateWithError` and only then builds the
// credential, or compares the leaf's data against a certificate compiled into
// the app. This rule reports the absence of any such call in the method, and
// leaves alone every method that makes one - a comparison it cannot read is
// still a decision somebody made.
import Foundation

class TrustAll: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // ruleid: swift-accepts-any-certificate
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}

class TrustAllInTwoSteps: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // ruleid: swift-accepts-any-certificate
        let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, credential)
    }
}

class Evaluates: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let trust = challenge.protectionSpace.serverTrust,
              SecTrustEvaluateWithError(trust, nil) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        // ok: swift-accepts-any-certificate
        completionHandler(.useCredential, URLCredential(trust: trust))
    }
}

class Pins: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let trust = challenge.protectionSpace.serverTrust,
              let chain = SecTrustCopyCertificateChain(trust) as? [SecCertificate],
              let leaf = chain.first else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        let sent = SecCertificateCopyData(leaf) as Data
        guard sent == Self.pinned else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        // ok: swift-accepts-any-certificate
        completionHandler(.useCredential, URLCredential(trust: trust))
    }

    static let pinned = Data()
}

class ClientCertificate: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // ok: swift-accepts-any-certificate
        let credential = URLCredential(identity: Self.identity, certificates: nil, persistence: .forSession)
        completionHandler(.useCredential, credential)
    }

    static let identity: SecIdentity! = nil
}
