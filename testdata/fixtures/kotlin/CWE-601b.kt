// CWE-601b: Open redirect via request.getParameter("next") without is_safe_url
package fixture

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class RedirectHandler {
    fun vuln1(request: HttpServletRequest, response: HttpServletResponse) {
        val next = request.getParameter("next")
        // ruleid: kotlin-601-fix
        response.sendRedirect(next)
    }

    fun vuln2(request: HttpServletRequest, response: HttpServletResponse) {
        val url = request.getParameter("url")
        // ruleid: kotlin-601-fix
        redirect(url)
    }

    fun vuln3(request: HttpServletRequest, response: HttpServletResponse) {
        val dest = request.getParameter("next")
        // ruleid: kotlin-601-fix
        call.respondRedirect(dest)
    }

    fun safeAllowlist(request: HttpServletRequest, response: HttpServletResponse) {
        val next = request.getParameter("next")
        if (!is_safe_url(next)) return
        // ok: kotlin-601-fix
        response.sendRedirect("/home")
    }

    fun safeFixed(request: HttpServletRequest, response: HttpServletResponse) {
        // ok: kotlin-601-fix
        response.sendRedirect("/home")
    }

    fun is_safe_url(u: String): Boolean { return u.startsWith("/") }
    fun redirect(u: String) {}
    val call = object { fun respondRedirect(u: String) {} }
}
