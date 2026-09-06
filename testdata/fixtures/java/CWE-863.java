// CWE-863: Incorrect Authorization — IDOR via findById with request parameter without auth check
// Direct object reference: request.getParameter("id") flows into findById without SecurityContext check.
package fixture;

import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.context.SecurityContextHolder;
import javax.servlet.http.HttpServletRequest;

@RestController
class IdorController {

    @GetMapping("/user")
    public String getUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        // ruleid: java-863-idor
        return userRepo.findById(id).toString();
    }

    @GetMapping("/account")
    public String getAccount(HttpServletRequest request) {
        String id = request.getParameter("id");
        // ruleid: java-863-idor
        return accountRepo.findById(id).toString();
    }

    @GetMapping("/data")
    public String getData(HttpServletRequest request) {
        String id = request.getParameter("id");
        // ruleid: java-863-idor
        return dataRepo.findById(id).toString();
    }

    // ok: java-863-idor — checks SecurityContext and uses hardcoded id
    @GetMapping("/safe")
    public String getSafe(HttpServletRequest request) {
        SecurityContextHolder.getContext().getAuthentication();
        return userRepo.findById("123").toString();
    }

    // ok: java-863-idor — uses hardcoded id, not from request
    @GetMapping("/safe2")
    public String getSafe2() {
        return userRepo.findById("123").toString();
    }

    // ok: java-863-idor — helper not a findById
    public String helper(String x) {
        return x;
    }
}
