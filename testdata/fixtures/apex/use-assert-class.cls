// The old assertion methods were replaced by the Assert class. Use
// Assert.areEqual and friends so failures report consistently.
public class UseAssertClass {
    public void vuln() {
        // ruleid: use-assert-class
        System.assert(true);
        // ruleid: use-assert-class
        System.assertEquals('a', 'a');
        // ruleid: use-assert-class
        System.assertNotEquals('a', 'b');
    }
    public void safe() {
        // ok: use-assert-class
        Assert.areEqual('a', 'a');
        // ok: use-assert-class
        Assert.isTrue(true);
        // ok: use-assert-class
        Assert.areNotEqual('a', 'b');
    }
}
