// CWE-312: the password is kept in SharedPreferences.
//
// SharedPreferences is an XML file in the app's data directory, stored exactly
// as it was written. That is private on a phone in the ordinary case, and it
// is not private on a rooted phone, in a full-device backup, on any build with
// `android:allowBackup="true"` - which is the default - or to anything that
// gets code running as the app. A password kept there is a password anyone who
// gets one copy of the device's data has, and unlike a session token it is the
// user's own and probably not only for this app.
//
// The store to reach for is EncryptedSharedPreferences, or better, the Android
// keystore and a token rather than the password.
package fixture

import android.content.SharedPreferences

class Prefs(private val prefs: SharedPreferences) {

    fun remember(password: String, refreshToken: String) {
        // ruleid: kotlin-credential-in-shared-preferences
        prefs.edit().putString("password", password).apply()

        // ruleid: kotlin-credential-in-shared-preferences
        prefs.edit().putString("refresh_token", refreshToken).commit()
    }

    fun rememberUser(username: String, theme: String) {
        // ok: kotlin-credential-in-shared-preferences
        prefs.edit().putString("username", username).apply()

        // ok: kotlin-credential-in-shared-preferences
        prefs.edit().putString("theme", theme).apply()
    }

    fun rememberFlag(seen: Boolean) {
        // ok: kotlin-credential-in-shared-preferences
        prefs.edit().putBoolean("onboarding_seen", seen).apply()
    }
}
