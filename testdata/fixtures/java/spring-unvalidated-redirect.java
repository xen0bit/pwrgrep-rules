import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RedirectController {
    // ruleid: spring-unvalidated-redirect
    @RequestMapping("/go")
    public String go(String url) {
        return "redirect:" + url;
    }

    // ruleid: spring-unvalidated-redirect
    @RequestMapping("/away")
    public String away(String dest) {
        return "redirect:" + dest;
    }

    // ruleid: spring-unvalidated-redirect
    @RequestMapping("/out")
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
