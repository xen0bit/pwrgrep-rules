// CWE-22: the caller chooses which file the app opens.
//
// An app's container is one directory tree, and `..` walks up out of the
// subdirectory the app meant to stay in. A deep link that carries
// `../../Library/Cookies/Cookies.binarycookies` reads the app's session
// cookies; one that carries a path under `Documents` writes over whatever the
// app keeps there.
//
// `appendingPathComponent` does not resolve or reject `..` - it concatenates.
// What makes a path safe is comparing the resolved result against the
// directory it was supposed to be under, and that is a comparison rather than
// a call, so this rule cannot see it. It reports where the path is built.
import Foundation

final class Files {

    let root = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    func openFromDeepLink(_ url: URL) {
        let name = url.fragment ?? ""
        // ruleid: swift-path-from-untrusted-input
        let target = root.appendingPathComponent(name)
        try? Data(contentsOf: target).write(to: target)
    }

    func openFromQuery(_ url: URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let name = components?.queryItems?.first?.value ?? ""
        let path = root.path + "/" + name
        // ruleid: swift-path-from-untrusted-input
        FileManager.default.createFile(atPath: path, contents: nil)
    }

    func openFixed() {
        // ok: swift-path-from-untrusted-input
        let target = root.appendingPathComponent("settings.json")
        try? Data().write(to: target)
    }

    func openChecked(_ url: URL) {
        let name = url.fragment ?? ""
        // ok: swift-path-from-untrusted-input
        let target = root.appendingPathComponent(name).standardizedFileURL
        guard target.path.hasPrefix(root.path) else { return }
        try? Data().write(to: target)
    }
}
