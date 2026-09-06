// CWE-22: Path Traversal – user input in File constructor without sanitization
// allows reading arbitrary files. Variable vs literal distinction.

public class TestCWE22 {
    public void vuln(String userInput, String other) {
        // ruleid: apex-path-traversal
        File f1 = new File(userInput);
        // ruleid: apex-path-traversal
        File f2 = new File(other);
        // ruleid: apex-path-traversal
        File f3 = new File(userInput);
        // ruleid: apex-path-traversal
        File f4 = new File(other);
    }
    public void safe() {
        // ok: apex-path-traversal
        File f1 = new File("/tmp/fixed.txt");
        // ok: apex-path-traversal
        File f2 = new File("/tmp/other.txt");
        // ok: apex-path-traversal
        File f3 = new File("/var/data/report.csv");
    }
}
