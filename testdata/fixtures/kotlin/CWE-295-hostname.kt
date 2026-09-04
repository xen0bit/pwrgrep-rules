// CWE-295: the certificate is checked and the name on it is not.
//
// A hostname verifier that returns true says a certificate issued for any name
// will do for this connection, so a valid certificate for a domain the
// attacker owns passes. It is the half of TLS that answers "am I talking to
// who I meant to", and returning true removes it while leaving every other
// part of the handshake in place - which is why it survives testing.
//
// Apache's ALLOW_ALL_HOSTNAME_VERIFIER is the same decision under a name that
// says so.
package fixture

import javax.net.ssl.HostnameVerifier
import javax.net.ssl.HttpsURLConnection
import javax.net.ssl.SSLSession

class Names {

    fun open(conn: HttpsURLConnection) {
        // ruleid: kotlin-accepts-any-hostname
        conn.hostnameVerifier = HostnameVerifier { _, _ -> true }
    }

    fun legacy(conn: HttpsURLConnection) {
        // ruleid: kotlin-accepts-any-hostname
        conn.setHostnameVerifier(org.apache.http.conn.ssl.SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER)
    }

    fun subclassed() = object : HostnameVerifier {
        // ruleid: kotlin-accepts-any-hostname
        override fun verify(hostname: String, session: SSLSession): Boolean { return true }
    }

    fun pinned(conn: HttpsURLConnection) {
        // ok: kotlin-accepts-any-hostname
        conn.hostnameVerifier = HostnameVerifier { host, session -> host == "api.example.com" }
    }

    fun checked() = object : HostnameVerifier {
        // ok: kotlin-accepts-any-hostname
        override fun verify(hostname: String, session: SSLSession): Boolean {
            return defaultVerifier.verify(hostname, session)
        }
    }

    private val defaultVerifier = HttpsURLConnection.getDefaultHostnameVerifier()
}
