// CWE-319: the address says http, so the request goes out in the clear.
//
// On a phone the network is somebody else's: a café access point, a captive
// portal, a carrier's transparent proxy. A cleartext request can be read and
// rewritten by all of them, and what comes back is whatever they sent - so
// this is not only a disclosure, it is a way to feed the app a response.
//
// The address is the whole of the evidence. A host that is only reachable on
// the loopback interface, or on the emulator's address for it, is not on
// anybody's network, and an XML namespace is not an address at all.
package fixture

import java.net.URL
import okhttp3.Request

class Api {

    fun fetch(): URL {
        // ruleid: kotlin-cleartext-http-url
        return URL("http://api.example.com/v1/orders")
    }

    fun request(): Request {
        // ruleid: kotlin-cleartext-http-url
        return Request.Builder().url("http://api.example.com/v1/orders").build()
    }

    fun secure(): URL {
        // ok: kotlin-cleartext-http-url
        return URL("https://api.example.com/v1/orders")
    }

    fun localDebug(): URL {
        // ok: kotlin-cleartext-http-url
        return URL("http://127.0.0.1:8080/health")
    }

    fun emulator(): URL {
        // ok: kotlin-cleartext-http-url
        return URL("http://10.0.2.2:8080/health")
    }

    fun namespace(): String {
        // ok: kotlin-cleartext-http-url
        return "http://schemas.android.com/apk/res/android"
    }
}
