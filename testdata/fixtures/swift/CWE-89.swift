// CWE-89: the query is assembled from something the caller chose.
//
// An iOS app's SQLite database is not a server's, and the impact is different
// rather than absent: the attacker is whoever can hand the app a URL - another
// app on the phone, a web page, a QR code - and what they get is every row of
// a database the app treats as trusted, including the rows belonging to other
// accounts the app has cached.
//
// `sqlite3_bind_text` is the fix and it is not more code, it is less: the ?
// placeholder means the value never has to be quoted or escaped at all.
import Foundation
import SQLite3

final class Store {

    var db: OpaquePointer?
    var stmt: OpaquePointer?

    func lookupFromDeepLink(_ url: URL) {
        let account = url.lastPathComponent
        let sql = "SELECT * FROM messages WHERE account = '\(account)'"
        // ruleid: swift-sql-built-from-untrusted-input
        sqlite3_exec(db, sql, nil, nil, nil)
    }

    func searchFromQuery(_ url: URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let term = components?.queryItems?.first?.value ?? ""
        let sql = "SELECT * FROM notes WHERE body LIKE '%" + term + "%'"
        // ruleid: swift-sql-built-from-untrusted-input
        sqlite3_prepare_v2(db, sql, -1, &stmt, nil)
    }

    func bound(_ url: URL) {
        let account = url.lastPathComponent
        let sql = "SELECT * FROM messages WHERE account = ?"
        // ok: swift-sql-built-from-untrusted-input
        sqlite3_prepare_v2(db, sql, -1, &stmt, nil)
        sqlite3_bind_text(stmt, 1, account, -1, nil)
    }

    func constant() {
        let sql = "SELECT COUNT(*) FROM messages"
        // ok: swift-sql-built-from-untrusted-input
        sqlite3_exec(db, sql, nil, nil, nil)
    }

    func internallyBuilt(_ limit: Int) {
        let sql = "SELECT * FROM messages LIMIT \(limit)"
        // ok: swift-sql-built-from-untrusted-input
        sqlite3_exec(db, sql, nil, nil, nil)
    }
}
