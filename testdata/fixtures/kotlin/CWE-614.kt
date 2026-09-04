// CWE-614: the session cookie is sent over http as well as https.
//
// Without the secure flag the browser attaches the cookie to a cleartext
// request too, so one stale bookmark or one embedded image over http puts the
// session on the wire for whoever runs the network.
//
// This file sets the flag somewhere, so the rule's file-level half - a cookie
// added in a file that never mentions setSecure - is switched off here, and
// what is left is the explicit refusal.
package fixture

import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletResponse

class Session {

    fun start(response: HttpServletResponse, id: String) {
        val cookie = Cookie("session", id)
        // ruleid: cookie-missing-secure-flag
        cookie.setSecure(false)
        response.addCookie(cookie)
    }

    fun startSafely(response: HttpServletResponse, id: String) {
        val cookie = Cookie("session", id)
        // ok: cookie-missing-secure-flag
        cookie.setSecure(true)
        response.addCookie(cookie)
    }
}
