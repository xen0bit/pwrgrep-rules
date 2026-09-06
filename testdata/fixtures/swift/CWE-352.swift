// CWE-352: CSRF - Form/Button without token
import SwiftUI

struct TransferView: View {
    var body: some View {
        // ruleid: swift-csrf
        Form {
            TextField("Amount", text: .constant(""))
            Button("Transfer") { submit() }
        }
    }
    func submit() {}
}

struct UpdateView: View {
    var body: some View {
        // ruleid: swift-csrf
        Form {
            TextField("Email", text: .constant(""))
            Button("Update") { }
        }
    }
}

struct SafeView: View {
    var body: some View {
        // ok: swift-csrf
        Form {
            TextField("Amount", text: .constant(""))
            Text(csrfToken)
            Button("Transfer") { }
        }
    }
    var csrfToken: String { "token123" }
}

struct SafeButton: View {
    var body: some View {
        // ok: swift-csrf
        Button("Submit") { }
        Text(csrfToken)
    }
    var csrfToken: String { "abc" }
}
struct ExtraView1: View {
    var body: some View {
        // ruleid: swift-csrf
        Form {
            TextField("Name", text: .constant(""))
            Button("Save") { submit() }
        }
    }
    func submit() {}
}

struct ExtraView2: View {
    var body: some View {
        // ruleid: swift-csrf
        Form {
            TextField("Title", text: .constant(""))
            Button("Create") { }
        }
    }
}

struct SafeExtraView: View {
    var body: some View {
        // ok: swift-csrf
        Form {
            TextField("Secure", text: .constant(""))
            Text(csrfToken)
            Button("Submit") { }
        }
    }
    var csrfToken: String { "secure123" }
}
