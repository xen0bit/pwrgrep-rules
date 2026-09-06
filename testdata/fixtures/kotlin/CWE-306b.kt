// CWE-306: Missing Authentication
package fixture
import org.springframework.web.bind.annotation.*
import org.springframework.security.access.prepost.PreAuthorize

@RestController
class AuthController {

    // ruleid: kotlin-missing-auth
    @GetMapping("/admin")
    fun admin(): String {
        return "secret"
    }

    // ruleid: kotlin-missing-auth
    @PostMapping("/transfer")
    fun transfer(): String {
        return "done"
    }

    // ruleid: kotlin-missing-auth
    @GetMapping("/sensitive")
    fun sensitive(): String {
        return "data"
    }

    // ok: kotlin-missing-auth
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin-secure")
    fun adminSecure(): String {
        return "secret"
    }

    // ok: kotlin-missing-auth
    @RequiresPermission("READ")
    @GetMapping("/read-secure")
    fun readSecure(): String {
        return "data"
    }
}
