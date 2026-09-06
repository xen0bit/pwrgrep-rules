package fixture;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URI;
import javax.servlet.http.HttpServletRequest;
import org.apache.http.client.methods.HttpGet;

class Cwe918b {

    InputStream viaUrl(HttpServletRequest request) throws Exception {
        String target = request.getParameter("url");
        // ruleid: java-ssrf
        URL url = new URL(target);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        return conn.getInputStream();
    }

    HttpGet viaHttpGet(HttpServletRequest request) {
        String where = request.getParameter("callback");
        // ruleid: java-ssrf
        return new HttpGet(where);
    }

    URI viaUriCreate(HttpServletRequest request) {
        String host = request.getParameter("host");
        String full = "http://" + host + "/status";
        // ruleid: java-ssrf
        return URI.create(full);
    }

    InputStream viaHeader(HttpServletRequest request) throws Exception {
        String upstream = request.getHeader("X-Target");
        // ruleid: java-ssrf
        URL url = new URL(upstream);
        return url.openStream();
    }

    // ok: java-ssrf
    InputStream safeConstant() throws Exception {
        URL url = new URL("https://api.example.com/status");
        return url.openStream();
    }

    // ok: java-ssrf
    InputStream safeFromConfig(String cfg) throws Exception {
        URL url = new URL(cfg);
        return url.openStream();
    }

    void safeWithFixedHost(HttpServletRequest request) throws Exception {
        String page = request.getParameter("page");
        // ok: java-ssrf - path under fixed host not host itself
        String fixed = "https://intranet.example.com/static";
        new URL(fixed);
    }
}
