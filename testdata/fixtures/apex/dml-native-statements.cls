// Native DML runs in system context. Prefer sharing-enforced access or
// move the operation where the context is explicit.
public class DmlNativeStatements {
    public void vuln(Account a, Account b, Account c) {
        // ruleid: dml-native-statements
        insert a;
        // ruleid: dml-native-statements
        update b;
        // ruleid: dml-native-statements
        delete c;
    }
    public void safe() {
        // ok: dml-native-statements
        List<Account> l = [SELECT Id FROM Account];
        // ok: dml-native-statements
        String s = 'insert test';
        // ok: dml-native-statements
        // delete leftover;
    }
}
