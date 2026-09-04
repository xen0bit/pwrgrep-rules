// CWE-532: a secret is written to the log.
//
// Android's log is a ring buffer, and everything an app writes to it goes into
// the bug reports the user sends, the crash reports the vendor collects, and -
// on a rooted or debuggable device, or through any app holding READ_LOGS - the
// screen of whoever asked. A password or a token in there is a password or a
// token in a file the app does not control the lifetime of.
//
// The interesting distinction is between logging a secret and logging *about*
// one. `Log.d(TAG, "password rejected")` is a message; `Log.d(TAG, password)`
// is the password.
package fixture

import android.util.Log

class Session {

    fun login(password: String, token: String) {
        // ruleid: kotlin-sensitive-value-logged
        Log.d(TAG, "authenticating with password $password")

        // ruleid: kotlin-sensitive-value-logged
        Log.i(TAG, "token=" + token)

        // ruleid: kotlin-sensitive-value-logged
        Log.v(TAG, apiSecret)
    }

    fun report(user: String) {
        // ok: kotlin-sensitive-value-logged
        Log.w(TAG, "password rejected for this account")

        // ok: kotlin-sensitive-value-logged
        Log.d(TAG, "signed in as $user")

        // ok: kotlin-sensitive-value-logged
        Log.e(TAG, "could not reach the token endpoint")
    }

    private val apiSecret = System.getenv("API_SECRET")

    companion object {
        private const val TAG = "Session"
    }
}
