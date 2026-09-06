// CWE-352: CSRF — Post mappings without token
package fixture
import org.springframework.web.bind.annotation.*

@RestController
class CsrfController {

    // ruleid: kotlin-csrf
    @PostMapping("/transfer")
    fun transfer(amount: String): String {
        return "transferred $amount"
    }

    // ruleid: kotlin-csrf
    @PostMapping("/update")
    fun update(email: String): String {
        return "updated $email"
    }

    // ruleid: kotlin-csrf
    @DeleteMapping("/delete")
    fun delete(id: String): String {
        return "deleted $id"
    }

    // ok: kotlin-csrf
    @PostMapping("/safe")
    fun safeTransfer(token: String, amount: String): String {
        verifyCsrf(token)
        return "ok"
    }

    // ok: kotlin-csrf
    @PostMapping("/safe2")
    fun safe2(csrfToken: String): String {
        val t = CsrfToken(csrfToken)
        return t.value
    }
}
