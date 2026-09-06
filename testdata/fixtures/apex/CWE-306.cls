// CWE-306: Missing Authentication – class without sharing performing DML

// ruleid: apex-missing-auth
public class TestCWE306 {
    public void doInsert() {
        insert myData;
    }
}

// ruleid: apex-missing-auth
public class TestCWE306b {
    public void doUpdate() {
        update myData;
    }
}

// ok: apex-missing-auth
public with sharing class TestCWE306Safe {
    public void doInsert() {
        insert myData;
    }
}

// ok: apex-missing-auth
public inherited sharing class TestCWE306Safe2 {
    public void safeMethod() {
        String s = 'hello';
    }
}

// ruleid: apex-missing-auth
public class TestCWE306c {
    public void doDelete() {
        delete myData;
    }
}

// ruleid: apex-missing-auth
public class TestCWE306d {
    public void doUpsert() {
        upsert myData;
    }
}

// ok: apex-missing-auth
public with sharing class TestCWE306Safe3 {
    public void doInsert() {
        insert otherData;
    }
}
