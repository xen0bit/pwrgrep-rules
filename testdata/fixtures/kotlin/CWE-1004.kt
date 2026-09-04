// CWE-1004: the session cookie is readable from JavaScript.
//
// Without HttpOnly one cross-site script anywhere on the origin reads the
// session cookie and posts it somewhere. The flag is what makes an XSS bug a
// defacement rather than an account takeover.
//
// This file sets the flag somewhere, so the rule's file-level half - a cookie
// added in a file that never mentions setHttpOnly - is switched off here, and
// what is left is the explicit refusal.
package fixture

import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletResponse

class Session {

    fun start(response: HttpServletResponse, id: String) {
        val cookie = Cookie("session", id)
        // ruleid: cookie-missing-httponly
        cookie.setHttpOnly(false)
        response.addCookie(cookie)
    }

    fun startSafely(response: HttpServletResponse, id: String) {
        val cookie = Cookie("session", id)
        // ok: cookie-missing-httponly
        cookie.setHttpOnly(true)
        response.addCookie(cookie)
    }
}
