// CWE-20: Improper input validation — request query without validation
package fixture

import java.io.File
import javax.servlet.http.HttpServletRequest

class TestCWE20 {
    fun vuln1(request: HttpServletRequest) {
        val q = request.getParameter("q")
        // ruleid: kotlin-20-validation
        File(q)
    }
    fun vuln2(request: HttpServletRequest) {
        val id = request.getParameter("id")
        // ruleid: kotlin-20-validation
        id.toInt()
    }
    fun vuln3(request: HttpServletRequest) {
        val p = request.getParameter("path")
        // ruleid: kotlin-20-validation
        Integer.parseInt(p)
    }
    fun safeAllowlist(request: HttpServletRequest) {
        val allowlist = request.getParameter("q")
        if (!allowlist.matches(Regex("[a-z]+"))) return
        // ok: kotlin-20-validation
        File(allowlist)
    }
    fun safeFixed() {
        // ok: kotlin-20-validation
        File("/tmp/fixed")
    }
}
