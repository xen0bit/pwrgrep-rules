// DML inside loops hits governor limits. Collect records and issue one
// DML statement outside the loop instead.
public class AvoidNativeDmlInLoops {
    public void vuln(List<Account> accs) {
        for (Account a : accs) {
            // ruleid: avoid-native-dml-in-loops
            insert a;
        }
        for (Account a : accs) {
            // ruleid: avoid-native-dml-in-loops
            update a;
        }
        while (accs.isEmpty() == false) {
            // ruleid: avoid-native-dml-in-loops
            delete accs;
        }
    }
    public void safe(List<Account> accs) {
        // ok: avoid-native-dml-in-loops
        insert accs;
        for (Account a : accs) {
            a.Name = 'fixed';
        }
        // ok: avoid-native-dml-in-loops
        update accs;
        // ok: avoid-native-dml-in-loops
        delete accs;
    }
}
