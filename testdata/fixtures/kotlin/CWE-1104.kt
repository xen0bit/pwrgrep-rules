// CWE-1104: DefaultHttpClient.
//
// Removed from Android in API 23 and deprecated in Apache HttpClient long
// before that. What makes it a security finding rather than a tidiness one is
// its TLS: SSLv3 and TLS 1.0, no SNI, and hostname verification that has to be
// configured rather than being right by default.
package fixture

import org.apache.http.impl.client.DefaultHttpClient
import okhttp3.OkHttpClient

class Http {

    fun legacy(): DefaultHttpClient {
        // ruleid: defaulthttpclient-is-deprecated
        return DefaultHttpClient()
    }

    fun modern(): OkHttpClient {
        // ok: defaulthttpclient-is-deprecated
        return OkHttpClient.Builder().build()
    }
}
