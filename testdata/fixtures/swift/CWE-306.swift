// CWE-306: Missing Auth - View without entitlement
import SwiftUI

// ruleid: swift-missing-auth
struct AdminView: View {
    var body: some View {
        Text("admin secret")
    }
}

// ruleid: swift-missing-auth
struct SensitiveView: View {
    var body: some View {
        Text("sensitive data")
    }
}

struct SafeAdminView: View {
    // ok: swift-missing-auth
    var body: some View {
        Text("admin")
    }
    var entitlement: String { "com.app.admin" }
}

struct SafeViewAuth: View {
    // ok: swift-missing-auth
    @Environment(\.authManager) var auth
    var body: some View {
        Text("authorized")
    }
}
// ruleid: swift-missing-auth
struct PublicView: View {
    var body: some View {
        Text("public data")
    }
}

// ruleid: swift-missing-auth
struct OpenView: View {
    var body: some View {
        Text("open content")
    }
}

struct SafeWithEntitlement: View {
    // ok: swift-missing-auth
    var body: some View {
        Text("protected")
    }
    var entitlement: String { "com.app.read" }
}
