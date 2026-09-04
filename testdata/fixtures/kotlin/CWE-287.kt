// CWE-287: the directory is queried without logging in.
//
// `Context.SECURITY_AUTHENTICATION` set to `"none"` is an anonymous bind. The
// directory answers, and what it answers is what it would answer anybody -
// which matters when the answer decides whether somebody is an administrator.
// Neither end of the connection has proved anything to the other.
//
// The finding lands on the setting rather than on the bind, because the
// setting is the line that has to change.
package fixture

import java.util.Hashtable
import javax.naming.Context
import javax.naming.directory.InitialDirContext

class Directory {

    fun lookup(): InitialDirContext {
        val env = Hashtable<String, String>()
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory")
        // ruleid: anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "none")
        return InitialDirContext(env, null)
    }

    fun authenticated(): InitialDirContext {
        val env = Hashtable<String, String>()
        // ok: anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "simple")
        env.put(Context.SECURITY_PRINCIPAL, principal)
        return InitialDirContext(env, null)
    }

    fun factory(): InitialDirContext {
        val env = Hashtable<String, String>()
        // ok: anonymous-ldap-bind
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory")
        return InitialDirContext(env, null)
    }

    private val principal = System.getenv("LDAP_PRINCIPAL")
}
