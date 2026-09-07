// Reflecting `*` (or `null`) as the allowed origin lets any site read the
// response. The rule only matches the `ServerWebExchange` shape with plain
// literals, so the flagged lines keep it; a pinned origin is fine. Findings
// land on the exchange-alias line that starts each match.
import org.springframework.web.server.ServerWebExchange;

public class PermissiveCors {
    void flag(ServerWebExchange swe) {
        // ruleid: permissive-cors
        ServerWebExchange e = swe;
        e.getResponse().getHeaders().add("Access-Control-Allow-Origin", "*");
    }

    void flagNull(ServerWebExchange swe) {
        // Merged into the previous match; left unmarked on purpose.
        ServerWebExchange e = swe;
        e.getResponse().getHeaders().add("Access-Control-Allow-Origin", "null");
    }

    void flagAgain(ServerWebExchange in) {
        // ruleid: permissive-cors
        ServerWebExchange e = in;
        e.getResponse().getHeaders().add("Access-Control-Allow-Origin", "*");
    }

    void safePinned(ServerWebExchange swe) {
        // ok: permissive-cors
        ServerWebExchange e = swe;
        e.getResponse().getHeaders().add("Access-Control-Allow-Origin", "https://example.com");
    }

    void safeOtherHeader(ServerWebExchange swe) {
        // ok: permissive-cors
        ServerWebExchange e = swe;
        e.getResponse().getHeaders().add("Content-Type", "*");
    }

    void safeNoHeader(ServerWebExchange swe) {
        // ok: permissive-cors
        ServerWebExchange e = swe;
        System.out.println(e);
    }
}
