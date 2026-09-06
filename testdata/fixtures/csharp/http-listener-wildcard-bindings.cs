// http-listener-wildcard-bindings: a `*` or `+` prefix answers on every
// hostname, letting DNS rebinding reach the listener. Name the host.
using System.Net;

namespace Fixture {
    public class Server {
        public void Vuln() {
            var l = new HttpListener();
            // ruleid: http-listener-wildcard-bindings
            l.Prefixes.Add("http://*:8080/");
            l.Start();
        }

        public void Vuln2() {
            var l = new HttpListener();
            // ruleid: http-listener-wildcard-bindings
            l.Prefixes.Add("https://+:8443/app/");
            l.Start();
        }

        // ok: http-listener-wildcard-bindings
        public void Safe() {
            var l = new HttpListener();
            l.Prefixes.Add("http://localhost:8080/");
            l.Start();
        }

        // ok: http-listener-wildcard-bindings
        public void Named() {
            var l = new HttpListener();
            l.Prefixes.Add("https://example.com:8443/app/");
            l.Start();
        }
    }
}
