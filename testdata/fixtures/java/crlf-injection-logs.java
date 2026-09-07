// Logging request input without neutralizing CRLF lets an attacker forge log
// entries. The rule is textual: the request parameter is comma-compact and
// the logged value sits in angle brackets; plain logging is fine. All three
// flagged triples share one method so the class-level context keeps covering
// them; findings land on each `getParameter` line.
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

public class CrlfInjectionLogs {
    static Logger log = Logger.getLogger(CrlfInjectionLogs.class);

    void flag(String unused,HttpServletRequest req,String other) {
        // ruleid: crlf-injection-logs
        String v1 = req.getParameter("a");
        log.info(<"v=" + v1>);
        // This triple merges into the previous match (the rule's `...` gaps
        // reach across statements), so it reports nothing on its own.
        String v3 = req.getParameter("c");
        log.error(<"v=" + v3>);
        // ruleid: crlf-injection-logs
        String v4 = req.getParameter("d");
        log.error(<"v=" + v4>);
    }

    void safeStatic(String unused, HttpServletRequest req, String other) {
        String val = req.getParameter("x");
        // ok: crlf-injection-logs
        log.info("static message");
    }

    void safeNoRequest(String message) {
        // ok: crlf-injection-logs
        log.info(message);
    }

    void safeConstant() {
        // ok: crlf-injection-logs
        log.info("startup complete");
    }
}
