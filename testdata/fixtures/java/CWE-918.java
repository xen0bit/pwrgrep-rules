package fixture;

// CWE-918: the request decides which host the server talks to.
//
// A URL that arrives in a parameter names anything the server can reach, and
// a server reaches more than its clients do: 127.0.0.1, the private ranges,
// and on a cloud instance the metadata service at 169.254.169.254 that hands
// credentials to anyone asking from the right place. Fetching it turns the
// server into a proxy into its own network.
//
// The sources are the request and nothing else. A URL out of a properties
// file is chosen by whoever runs the program, which is a different question,
// and reporting it would bury this one.
//
// No sanitizer is named. Deciding a URL is safe means resolving it and
// looking at the address it resolved to, and a rule that cannot see a
// resolver has no business treating an allowlist it cannot read as one.

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.Socket;
import java.net.URI;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import org.apache.http.client.methods.HttpGet;
import org.springframework.web.client.RestTemplate;

class Cwe918 {

    InputStream fetchWhateverItIsAsked(HttpServletRequest request) throws Exception {
        String target = request.getParameter("url");
        // ruleid: java-request-decides-the-host
        URL url = new URL(target);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        return connection.getInputStream();
    }

    String proxyHeader(HttpServletRequest request) {
        String upstream = request.getHeader("X-Upstream");
        RestTemplate template = new RestTemplate();
        // ruleid: java-request-decides-the-host
        return template.getForObject(upstream, String.class);
    }

    HttpGet buildFromQuery(HttpServletRequest request) {
        String where = request.getParameter("callback");
        // ruleid: java-request-decides-the-host
        return new HttpGet(where);
    }

    // Two hops through a concatenation still ends at a host the caller picked,
    // because the caller picked the part in front of the slash.
    URI viaConcatenation(HttpServletRequest request) {
        String host = request.getParameter("host");
        String full = "http://" + host + "/status";
        // ruleid: java-request-decides-the-host
        return URI.create(full);
    }

    Socket connectWherever(HttpServletRequest request) throws Exception {
        String host = request.getParameter("host");
        // ruleid: java-request-decides-the-host
        return new Socket(host, 8080);
    }

    // A host out of configuration is chosen by whoever deployed this.
    InputStream fetchConfigured(String configuredEndpoint) throws Exception {
        // ok: java-request-decides-the-host
        URL url = new URL(configuredEndpoint);
        return url.openStream();
    }

    // The request decides a path under a host the program fixed, which is a
    // different weakness and not this one.
    String appendPath(HttpServletRequest request) {
        String page = request.getParameter("page");
        RestTemplate template = new RestTemplate();
        // ok: java-request-decides-the-host
        return template.getForObject("https://intranet.example.com/wiki", String.class, page);
    }
}
