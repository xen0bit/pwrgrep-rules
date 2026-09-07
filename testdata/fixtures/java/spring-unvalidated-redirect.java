import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RedirectController {
    @RequestMapping("/go")
    // ruleid: spring-unvalidated-redirect
    public String go(String url) {
        return "redirect:" + url;
    }

    @RequestMapping("/away")
    // ruleid: spring-unvalidated-redirect
    public String away(String dest) {
        return "redirect:" + dest;
    }

    @RequestMapping("/out")
    // ruleid: spring-unvalidated-redirect
    public String out(String target) {
        return "redirect:" + target;
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    // ok: spring-unvalidated-redirect
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/fixed", method = RequestMethod.GET)
    // ok: spring-unvalidated-redirect
    public String fixed() {
        return "redirect:/home";
    }

    @RequestMapping("/plain")
    // ok: spring-unvalidated-redirect
    public String plain(String name) {
        return "hello " + name;
    }
}
