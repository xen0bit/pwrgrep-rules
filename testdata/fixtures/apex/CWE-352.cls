// CWE-352: Cross-Site Request Forgery via DML in constructor
// DML in constructor can be triggered by page load

public class VulnCWE352a {
    public VulnCWE352a() {
        // ruleid: apex-csrf-constructor
        insert myData;
    }
}

public class SafeCWE352a {
    public void safeMethod() {
        // ok: apex-csrf-constructor
        String s = 'safe';
    }
}

public class VulnCWE352b {
    public VulnCWE352b() {
        // ruleid: apex-csrf-constructor
        update myOtherData;
    }
}

public class SafeCWE352b {
    public void safeAgain() {
        // ok: apex-csrf-constructor
        System.assertEquals('a', 'a');
    }
}

public class VulnCWE352c {
    public VulnCWE352c() {
        // ruleid: apex-csrf-constructor
        delete myData;
    }
}

public class VulnCWE352d {
    public VulnCWE352d() {
        // ruleid: apex-csrf-constructor
        upsert myData;
    }
}

public with sharing class SafeCWE352c {
    public SafeCWE352c() {
        // ok: apex-csrf-constructor
        insert myData;
    }
}
