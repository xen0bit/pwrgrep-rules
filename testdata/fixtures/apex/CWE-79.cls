// CWE-79: Cross-site Scripting via unescaped concatenation
//
// Concatenating user input directly into HTML string lets an attacker
// inject script. The sink is '<div>' + userInput without escaping.

public class TestCWE79 {
    public void vuln(String userInput) {
        // ruleid: apex-xss
        String html1 = '<div>' + userInput;
        // ruleid: apex-xss
        String html2 = '<p>' + userInput + '</p>';
        // ruleid: apex-xss
        String html3 = '<span>' + userInput;
    }

    public void safe() {
        // ok: apex-xss
        String html1 = '<div>hello</div>';
        // ok: apex-xss
        String html2 = '<p>fixed</p>';
        // ok: apex-xss
        String html3 = '<span>safe</span>';
    }
}
