import javax.naming.directory.SearchControls;

public class LdapEntryPoison {
    public void vuln() {
        SearchControls sc = new SearchControls();
        // ruleid: ldap-entry-poisoning
        sc.setReturningObjFlag(true);
    }

    public void vulnAgain() {
        SearchControls sc = new SearchControls();
        // ruleid: ldap-entry-poisoning
        sc.setReturningObjFlag(true);
    }

    public void vulnCtor() {
        // ruleid: ldap-entry-poisoning
        Object o = new SearchControls(1, 2L, 3, null, true, false);
    }

    public void safe() {
        SearchControls sc = new SearchControls();
        // ok: ldap-entry-poisoning
        sc.setReturningObjFlag(false);
    }

    public void safeCtor() {
        // ok: ldap-entry-poisoning
        Object o = new SearchControls(1, 2L, 3, null, false, false);
    }

    public void plain(boolean flag) {
        // ok: ldap-entry-poisoning
        System.out.println(flag);
    }
}
