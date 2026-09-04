// CWE-78: the command line was assembled.
//
// This rule asks the question of the syntax rather than of the value: it
// reports a command built by concatenation or by String.format whether or not
// the pieces came from anywhere untrusted. That is the coarse half of a pair -
// kotlin-command-from-untrusted-input follows a value from an intent and
// reports where it lands - and it catches the case where the untrusted half
// arrived somewhere neither rule can see.
package fixture

class Runner {

    fun ping(host: String) {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("ping -c 1 " + host)
    }

    fun formatted(host: String) {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec(String.format("ping -c 1 %s", host))
    }

    fun library(name: String) {
        // ruleid: command-injection-formatted-runtime-call
        Runtime.getRuntime().loadLibrary("lib" + name)
    }

    fun version() {
        // ok: command-injection-formatted-runtime-call
        Runtime.getRuntime().exec("getprop ro.build.version.release")
    }

    fun fixed() {
        // ok: command-injection-formatted-runtime-call
        Runtime.getRuntime().loadLibrary("native-lib")
    }
}
