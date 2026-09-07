// Absolute Salesforce URLs break in sandboxes and scratch orgs where the
// domain differs. Use relative URLs or named pages instead.
public class AbsoluteUrls {
    public void vuln() {
        // ruleid: absolute-urls
        String a = 'https://my.salesforce.com/apex/page';
        // ruleid: absolute-urls
        String b = 'http://test.force.com/home';
        // ruleid: absolute-urls
        String c = 'https://c.visualforce.com/apex/app';
    }
    public void safe() {
        // ok: absolute-urls
        String a = '/apex/page';
        // ok: absolute-urls
        String b = 'https://example.com/apex/page';
        // ok: absolute-urls
        String c = Page.Home.getUrl();
    }
}
