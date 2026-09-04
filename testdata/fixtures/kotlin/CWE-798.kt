// CWE-798: the credential is in the APK.
//
// An Android app is a zip file on a device the attacker owns. `apktool d` and
// a grep is the whole of the work, and a key compiled into a `const val` is a
// key in every copy of the app that was ever installed - so rotating it means
// shipping a release and waiting for people to take it.
//
// What separates a credential from a name is the value rather than the name.
// `"password"` beside `"host"` is a keyword table; `"API_KEY"` is what the
// value is called somewhere else; `"\${api.key}"` is the fix, not the bug.
package fixture

object Config {

    // ruleid: kotlin-credential-is-a-literal
    private const val API_KEY = "AIzaSyD3vK8pQ2mN7xR1tY9wZ4bC6eF0gH5jL2k"

    // ruleid: kotlin-credential-is-a-literal
    private val dbPassword = "hunter2"

    // ruleid: kotlin-credential-is-a-literal
    const val ADMIN_SECRET: String = "s3cr3t-admin-2019"

    // ok: kotlin-credential-is-a-literal
    private const val API_KEY_PROPERTY = "com.example.apiKey"

    // ok: kotlin-credential-is-a-literal
    private const val PASSWORD_FIELD = "password"

    // ok: kotlin-credential-is-a-literal
    private const val TOKEN_PLACEHOLDER = "\${auth.token}"

    // ok: kotlin-credential-is-a-literal
    private val apiKey = BuildConfig.API_KEY

    // ok: kotlin-credential-is-a-literal
    private val emptyPassword = ""

    // ok: kotlin-credential-is-a-literal
    const val BASE_URL = "https://api.example.com"
}
