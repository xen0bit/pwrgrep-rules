// CWE-502: Deserialization of Untrusted Data via JSON.deserialize
// JSON.deserialize with attacker-controlled string can instantiate arbitrary types.

public class TestCWE502 {
    public void vuln(String userInput) {
        // ruleid: apex-deserialization
        Object o1 = JSON.deserialize(userInput, MyClass.class);
        // ruleid: apex-deserialization
        Object o2 = JSON.deserializeUntyped(userInput);
        // ruleid: apex-deserialization
        Object o3 = JSON.deserialize(userInput);
        String data = userInput;
        // ruleid: apex-deserialization
        Object o4 = JSON.deserialize(data, MyClass.class);
    }
    public void safe() {
        // ok: apex-deserialization
        Object o1 = JSON.deserialize('{"a":1}', MyClass.class);
        // ok: apex-deserialization
        Object o2 = JSON.deserializeUntyped('{"a":1}');
        // ok: apex-deserialization
        Object o3 = JSON.deserialize('{"k":"v"}');
    }
    public class MyClass { String a; }
}
