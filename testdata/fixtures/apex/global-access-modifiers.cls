// Global access modifiers can never be removed or renamed in managed
// packages. Prefer public with explicit sharing instead.
public class GlobalAccessModifiers {
    // ruleid: global-access-modifiers
    global String sharedName;
    // ruleid: global-access-modifiers
    global void sharedMethod() {}
    // ruleid: global-access-modifiers
    global class Inner {}
    // ok: global-access-modifiers
    public String okName;
    // ok: global-access-modifiers
    public void okMethod() {}
    // ok: global-access-modifiers
    // global String commentedOut;
}
