import javax.naming.Context;
import javax.naming.directory.InitialDirContext;
import java.util.Hashtable;

public class AnonymousLdapBind {
    public void vuln() throws Exception {
        Hashtable<String, String> env = new Hashtable<>();
        // ruleid: anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "none");
        InitialDirContext ctx = new InitialDirContext(env);
    }

    public void vulnAgain() throws Exception {
        Hashtable<String, String> env = new Hashtable<>();
        // ruleid: anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "none");
        InitialDirContext ctx = new InitialDirContext(env, null);
    }

    public void vulnThird() throws Exception {
        Hashtable<String, String> env = new Hashtable<>();
        // ruleid: anonymous-ldap-bind
        env.put(Context.SECURITY_AUTHENTICATION, "none");
        InitialDirContext ctx = new InitialDirContext(env);
    }

    public void safe() throws Exception {
        Hashtable<String, String> env = new Hashtable<>();
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        // ok: anonymous-ldap-bind
        InitialDirContext ctx = new InitialDirContext(env);
    }

    public void safeAgain() throws Exception {
        Hashtable<String, String> env = new Hashtable<>();
        // ok: anonymous-ldap-bind
        InitialDirContext ctx = new InitialDirContext(env);
    }

    public void plain() {
        // ok: anonymous-ldap-bind
        System.out.println("none in a comment is not a bind");
    }
}
