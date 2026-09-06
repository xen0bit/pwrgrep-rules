// CWE-306: Missing Authentication for Critical Function
// Spring controllers should require authentication via @PreAuthorize etc.
// An endpoint without auth can be called by anyone.
package fixture;

import org.springframework.web.bind.annotation.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.access.annotation.Secured;

@RestController
class UserController {

    // ruleid: java-missing-auth
    @GetMapping("/admin")
    public String getAdmin() {
        return "secret";
    }

    // ruleid: java-missing-auth
    @PostMapping("/transfer")
    public String doTransfer() {
        return "transferred";
    }

    // ruleid: java-missing-auth
    @RequestMapping("/sensitive")
    public String sensitive() {
        return "data";
    }

    // ok: java-missing-auth
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin-secure")
    public String getAdminSecure() {
        return "secret";
    }

    // ok: java-missing-auth
    @Secured("ROLE_USER")
    @PostMapping("/transfer-secure")
    public String doTransferSecure() {
        return "transferred";
    }

    // ok: java-missing-auth — helper not a request mapping
    public String helper() {
        return "helper";
    }
}
