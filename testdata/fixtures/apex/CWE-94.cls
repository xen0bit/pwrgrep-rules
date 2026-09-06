// CWE-94: Code Injection via Type.forName with user input
//
// Type.forName with attacker-controlled string can instantiate arbitrary
// Apex classes, leading to code execution.

public class TestCWE94 {
    public void vuln(String userInput, String other) {
        // ruleid: apex-code-injection
        Type t1 = Type.forName(userInput);
        // ruleid: apex-code-injection
        Type t2 = Type.forName(other);
        String cls = userInput;
        // ruleid: apex-code-injection
        Type t3 = Type.forName(cls);
    }

    public void safe() {
        // ok: apex-code-injection
        Type t1 = Type.forName('MyClass');
        // ok: apex-code-injection
        Type t2 = Type.forName('OtherClass');
        // ok: apex-code-injection
        Type t3 = Type.forName('SafeClass');
    }
}
