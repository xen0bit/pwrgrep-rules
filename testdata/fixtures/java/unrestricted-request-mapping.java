import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MappingController {
    // ruleid: unrestricted-request-mapping
    @RequestMapping("/go")
    public String go() {
        return "go";
    }

    // ruleid: unrestricted-request-mapping
    @RequestMapping("/away")
    public String away() {
        return "away";
    }

    // ruleid: unrestricted-request-mapping
    @RequestMapping("/out")
    public String out() {
        return "out";
    }

    // ok: unrestricted-request-mapping
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

    // ok: unrestricted-request-mapping
    @RequestMapping(value = "/fixed", method = RequestMethod.POST)
    public String fixed() {
        return "fixed";
    }

    // ok: unrestricted-request-mapping
    public String plain() {
        return "no mapping here";
    }
}
