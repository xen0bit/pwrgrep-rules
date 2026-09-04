// CWE-295: the app is told the certificate is wrong and carries on.
//
// A TrustManager whose `checkServerTrusted` does nothing accepts a certificate
// signed by anybody, and a WebView client that calls `handler.proceed()` on an
// SSL error accepts one the platform has already rejected. Either way there is
// no longer anything between the app and whoever controls the network: TLS
// still encrypts the connection, to the attacker.
//
// This is the single most common way an Android app loses its transport
// security, and it is almost always a debugging shortcut that shipped.
package fixture

import android.webkit.SslErrorHandler
import android.webkit.WebViewClient
import java.security.cert.X509Certificate
import javax.net.ssl.X509TrustManager

class Transport {

    fun manager(): X509TrustManager = object : X509TrustManager {
        // ruleid: kotlin-trusts-any-certificate
        override fun checkServerTrusted(chain: Array<X509Certificate>, authType: String) {}

        override fun checkClientTrusted(chain: Array<X509Certificate>, authType: String) {}

        override fun getAcceptedIssuers(): Array<X509Certificate> = arrayOf()
    }

    fun client() = object : WebViewClient() {
        // ruleid: kotlin-trusts-any-certificate
        override fun onReceivedSslError(view: android.webkit.WebView, handler: SslErrorHandler, error: android.net.http.SslError) {
            handler.proceed()
        }
    }

    fun careful() = object : WebViewClient() {
        // ok: kotlin-trusts-any-certificate
        override fun onReceivedSslError(view: android.webkit.WebView, handler: SslErrorHandler, error: android.net.http.SslError) {
            handler.cancel()
        }
    }

    fun pinned(): X509TrustManager = object : X509TrustManager {
        // ok: kotlin-trusts-any-certificate
        override fun checkServerTrusted(chain: Array<X509Certificate>, authType: String) {
            delegate.checkServerTrusted(chain, authType)
        }

        override fun checkClientTrusted(chain: Array<X509Certificate>, authType: String) {}

        override fun getAcceptedIssuers(): Array<X509Certificate> = delegate.acceptedIssuers
    }

    private lateinit var delegate: X509TrustManager
}
