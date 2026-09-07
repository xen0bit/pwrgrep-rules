// SOSL inside loops hits the search governor limit. Search once outside
// the loop and iterate the results instead.
public class AvoidSoslInLoops {
    public void vuln(List<List<SObject>> found) {
        for (Integer i = 0; i < 5; i++) {
            // ruleid: avoid-sosl-in-loops
            found = Search.query('FIND {fixed} IN ALL FIELDS RETURNING Account');
        }
        for (Integer i = 0; i < 5; i++) {
            // ruleid: avoid-sosl-in-loops
            found = Search.query('FIND {other} IN ALL FIELDS RETURNING Contact');
        }
        while (found.isEmpty()) {
            // ruleid: avoid-sosl-in-loops
            found = Search.query('FIND {third} IN ALL FIELDS RETURNING Lead');
            break;
        }
    }
    public void safe(List<List<SObject>> found) {
        // ok: avoid-sosl-in-loops
        found = Search.query('FIND {fixed} IN ALL FIELDS RETURNING Account');
        for (Integer i = 0; i < 3; i++) {
            String s = 'fixed';
        }
        // ok: avoid-sosl-in-loops
        List<Account> x = [SELECT Id FROM Account];
        // ok: avoid-sosl-in-loops
        String q = 'fixed query';
    }
}
