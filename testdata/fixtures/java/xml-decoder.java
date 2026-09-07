import java.beans.XMLDecoder;
import java.io.InputStream;

public class XmlDecoderUse {
    public void vuln(InputStream in) {
        // ruleid: xml-decoder
        Object o = new XMLDecoder(in);
    }

    public void vulnAgain(InputStream in) {
        // ruleid: xml-decoder
        Object o = new XMLDecoder(in);
    }

    public void vulnThird(java.io.ByteArrayInputStream in) {
        // ruleid: xml-decoder
        Object o = new XMLDecoder(in);
    }

    public void safe(InputStream in) {
        // ok: xml-decoder
        System.out.println(in);
    }

    public void plain() {
        // ok: xml-decoder
        System.out.println("XMLDecoder in a comment is not use");
    }

    public void helper(InputStream in) {
        // ok: xml-decoder
        System.out.println(in);
    }
}
