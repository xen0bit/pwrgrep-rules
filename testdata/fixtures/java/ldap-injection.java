import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

public class LdapInjection {
    public void vuln(DirContext ctx, String filter) throws Exception {
        // ruleid: ldap-injection
        ctx.search("ou=people", filter);
    }

    public void vulnAgain(DirContext ctx, String filter) throws Exception {
        // ruleid: ldap-injection
        ctx.search("ou=people", "(uid=" + filter + ")");
    }

    public void vulnThird(DirContext ctx, String base, String filter) throws Exception {
        // ruleid: ldap-injection
        ctx.search(base, filter, null);
    }

    public void safe(DirContext ctx) throws Exception {
        // ok: ldap-injection
        ctx.search("ou=people", "(uid=ann)");
    }

    public void safeAgain(DirContext ctx) throws Exception {
        // ok: ldap-injection
        ctx.search("ou=people", "(objectClass=*)");
    }

    public void plain(String filter) {
        // ok: ldap-injection
        System.out.println(filter);
    }
}
