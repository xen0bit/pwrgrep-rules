// CWE-862: Missing Authorization — NavigationLink without hasRole allows unauthorized navigation
// SwiftUI NavigationLink that is not gated by hasRole/auth lets any user navigate to sensitive views.
import SwiftUI

struct AdminLinkView: View {
    var body: some View {
        // ruleid: swift-862-authz
        NavigationLink(destination: AdminView()) {
            Text("Admin")
        }
    }
}

struct SettingsLinkView: View {
    var body: some View {
        // ruleid: swift-862-authz
        NavigationLink("Settings", destination: SettingsView())
    }
}

struct DetailNavView: View {
    var body: some View {
        // ruleid: swift-862-authz
        NavigationLink(value: "detail") {
            Text("Detail")
        }
    }
}

// ok: swift-862-authz — helper not a NavigationLink
func helperOne() {
    print("helper")
}

// ok: swift-862-authz — another helper not a NavigationLink
func helperTwo(x: Int) -> Int {
    return x + 1
}

// ok: swift-862-authz — view without navigation
struct SimpleView: View {
    var body: some View {
        Text("hello")
    }
}

struct AdminView: View { var body: some View { Text("admin") } }
struct SettingsView: View { var body: some View { Text("settings") } }
struct DetailView: View { var value: String; var body: some View { Text(value) } }
