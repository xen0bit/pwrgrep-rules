// DML in a static initializer runs on class load, so merely visiting a
// page can modify the database. Move it into an explicit method instead.
public class ApexCsrfStaticConstructor {
    static {
        // ruleid: apex-csrf-static-constructor
        insert myData;
    }
    static {
        // ruleid: apex-csrf-static-constructor
        update myOther;
    }
    static {
        // ruleid: apex-csrf-static-constructor
        delete myThird;
    }
    public void safe() {
        // ok: apex-csrf-static-constructor
        insert myData;
    }
    static {
        // ok: apex-csrf-static-constructor
        String s = 'fixed';
    }
    public void safeAgain() {
        // ok: apex-csrf-static-constructor
        String t = 'fixed';
    }
}
