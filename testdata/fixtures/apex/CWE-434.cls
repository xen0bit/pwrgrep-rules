// CWE-434: ContentVersion VersionData without content type allowlist
public class TestCWE434 {
    public void vuln1(Blob fileBody, String fileName) {
        ContentVersion cv = new ContentVersion();
        cv.VersionData = fileBody;
        cv.PathOnClient = fileName;
        // ruleid: apex-434-upload
        insert cv;
    }
    public void vuln2(Blob fileBody, String fileName) {
        ContentVersion cv2 = new ContentVersion(VersionData = fileBody, PathOnClient = fileName);
        // ruleid: apex-434-upload
        Database.insert(cv2);
    }
    public void vuln3(Blob fileBody, String fileName) {
        ContentVersion cv3 = new ContentVersion();
        cv3.VersionData = fileBody;
        cv3.PathOnClient = fileName;
        // ruleid: apex-434-upload
        Database.insert(cv3, false);
    }
    public void safeAllowlist(Blob fileBody, String fileName) {
        ContentVersion allowlist = new ContentVersion();
        allowlist.VersionData = fileBody;
        allowlist.PathOnClient = fileName;
        if (!allowlist.PathOnClient.endsWith('.png') && !allowlist.PathOnClient.endsWith('.jpg')) {
            return;
        }
        // ok: apex-434-upload
        insert allowlist;
    }
    public void safeFixed() {
        ContentVersion whitelist = new ContentVersion();
        whitelist.VersionData = Blob.valueOf('fixed');
        whitelist.PathOnClient = 'allowed.png';
        // ok: apex-434-upload
        insert whitelist;
    }
}
