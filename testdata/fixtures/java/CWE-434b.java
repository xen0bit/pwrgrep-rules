// CWE-434b: Unrestricted upload second — getSubmittedFileName reaches Files.write/new File
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import javax.servlet.http.Part;

public class CWE434b {
    public void vuln1(Part filePart) throws Exception {
        String fileName = filePart.getSubmittedFileName();
        // ruleid: java-unrestricted-upload
        Files.write(Path.of("/uploads/" + fileName), filePart.getInputStream().readAllBytes());
    }

    public void vuln2(Part part) throws Exception {
        String name = part.getSubmittedFileName();
        // ruleid: java-unrestricted-upload
        File f = new File("/tmp/" + name);
    }

    public void vuln3(javax.servlet.http.HttpServletRequest request) throws Exception {
        Part p = request.getPart("file");
        String n = p.getSubmittedFileName();
        // ruleid: java-unrestricted-upload
        new File("/uploads", n);
    }

    public void safeFixed() throws Exception {
        String fileName = "fixed.txt";
        // ok: java-unrestricted-upload
        Files.write(Path.of("/uploads/" + fileName), "fixed".getBytes());
        // ok: java-unrestricted-upload
        File f = new File("/tmp/" + fileName);
    }

    public void safeWhitelist(Part filePart) throws Exception {
        String fileName = filePart.getSubmittedFileName();
        if (!fileName.endsWith(".png")) throw new IllegalArgumentException("bad");
        // ok: java-unrestricted-upload
        Files.write(Path.of("/uploads/safe.png"), filePart.getInputStream().readAllBytes());
    }
}
