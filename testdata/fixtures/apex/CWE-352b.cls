// CWE-352: CSRF via DML without token validation

public class TestCWE352c {
    public TestCWE352c() {
        // ruleid: apex-csrf
        insert acc;
    }
}

public class TestCWE352d {
    public void doAction() {
        // ruleid: apex-csrf
        update acc;
    }
}

// ok: apex-csrf
public class TestCWE352Safe {
    public void safeMethod() {
        String s = 'CSRF token validated';
        System.debug(s);
    }
}

// ok: apex-csrf
public class TestCWE352Safe2 {
    public void safeWithApexPages() {
        String token = ApexPages.currentPage().getParameters().get('csrf');
        System.debug(token);
    }
}
Account acc = new Account();
public class TestCWE352e {
    public void doDelete() {
        // ruleid: apex-csrf
        delete acc;
    }
}

public class TestCWE352f {
    public void doUpsert() {
        // ruleid: apex-csrf
        upsert acc;
    }
}

public with sharing class TestCWE352Safe3 {
    public void safeWithSharing() {
        // ok: apex-csrf
        String s = 'CSRF validated via token';
        System.debug(s);
    }
}
