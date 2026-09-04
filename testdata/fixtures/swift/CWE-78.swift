// CWE-78: the shell gets a string somebody else wrote.
//
// This is macOS Swift rather than iOS - a sandboxed app cannot spawn a process
// at all - and it is the same weakness it is everywhere. `Process` with
// `/bin/sh -c` hands the whole argument to a shell, so a `;` or a backtick in
// the middle of it starts a second command with the app's privileges.
//
// Passing the program and its arguments separately is the fix, and it is the
// default: `executableURL` plus an `arguments` array never involves a shell,
// so a semicolon in an argument is just a semicolon.
import Foundation

final class Tools {

    func convertFromDeepLink(_ url: URL) {
        let name = url.lastPathComponent
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/sh")
        // ruleid: swift-command-from-untrusted-input
        task.arguments = ["-c", "convert \(name) out.png"]
        try? task.run()
    }

    func inspectFromPasteboard() {
        let target = UIPasteboard.general.string ?? ""
        let task = Process()
        task.launchPath = "/bin/bash"
        // ruleid: swift-command-from-untrusted-input
        task.arguments = ["-c", "file " + target]
        task.launch()
    }

    func convertFixed() {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/sh")
        // ok: swift-command-from-untrusted-input
        task.arguments = ["-c", "convert in.png out.png"]
        try? task.run()
    }

    func convertSeparately(_ url: URL) {
        let name = url.lastPathComponent
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/convert")
        // ok: swift-command-from-untrusted-input
        task.arguments = [name, "out.png"]
        try? task.run()
    }
}
