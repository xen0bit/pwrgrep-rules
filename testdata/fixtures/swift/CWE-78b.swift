// CWE-78: Swift command injection via Process
import Foundation
func vuln(url: URL, textField: UITextField) {
    let t = Process()
    // ruleid: swift-os-command
    t.arguments = ["-c", url.fragment!]
    // ruleid: swift-os-command
    t.arguments = ["-c", textField.text!]
    // ok: swift-os-command
    t.arguments = ["-c", "fixed"]
    // ok: swift-os-command
    t.arguments = ["--help"]
}
class UITextField { var text: String? = nil }
func vulnExtra(url: URL) {
    let proc = Process()
    // ruleid: swift-os-command
    proc.arguments = ["-c", url.absoluteString]
    // ruleid: swift-os-command
    proc.arguments = ["-c", UIPasteboard.general.string!]
}
func safeExtra() {
    let proc = Process()
    // ok: swift-os-command
    proc.arguments = ["-c", "fixed_command"]
}
