import org.apache.commons.mail.SimpleEmail;

public class InsecureSmtp {
    public void vuln() throws Exception {
        SimpleEmail email = new SimpleEmail();
        // ruleid: insecure-smtp-connection
        email.send();
    }

    public void vulnAgain() throws Exception {
        SimpleEmail email = new SimpleEmail();
        // ruleid: insecure-smtp-connection
        email.send();
    }

    public void vulnThird() throws Exception {
        SimpleEmail email = new SimpleEmail();
        // ruleid: insecure-smtp-connection
        email.send();
    }

    public void safe() throws Exception {
        SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.example.com");
        // ok: insecure-smtp-connection
        System.out.println(email);
    }

    public void plain() {
        // ok: insecure-smtp-connection
        System.out.println("send in a comment is not a call");
    }

    public void helper(String msg) {
        // ok: insecure-smtp-connection
        System.out.println(msg);
    }
}
