import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import javax.servlet.http.Part;

public class UploadTest {
    public void vuln1(Part filePart) throws Exception {
        String fileName = filePart.getSubmittedFileName();
        // ruleid: java-434-upload
        File file = new File("/uploads/" + fileName);
        filePart.write(file.getPath());
    }
    public void vuln2(javax.servlet.http.HttpServletRequest request) throws Exception {
        Part part = request.getPart("file");
        String name = part.getSubmittedFileName();
        // ruleid: java-434-upload
        Files.write(Path.of("/tmp/" + name), part.getInputStream().readAllBytes());
    }
    public void vuln3(Part filePart) throws Exception {
        String fileName = filePart.getSubmittedFileName();
        // ruleid: java-434-upload
        Files.write(Path.of("/uploads/" + fileName), filePart.getInputStream().readAllBytes());
    }
    public void vuln4(javax.servlet.http.HttpServletRequest request) throws Exception {
        String name = request.getPart("upload").getSubmittedFileName();
        // ruleid: java-434-upload
        File f = new File("/tmp/" + name);
        request.getPart("upload").write(f.getPath());
    }
    public void safe1() throws Exception {
        String fileName = "fixed.txt";
        // ok: java-434-upload
        File file = new File("/uploads/" + fileName);
        Files.write(file.toPath(), "fixed".getBytes());
    }
    public void safe2() throws Exception {
        String name = "safe.txt";
        // ok: java-434-upload
        File f = new File("/tmp/" + name);
    }
    public void safe3() throws Exception {
        String safe = "allowed.txt";
        // ok: java-434-upload
        File file = new File("/tmp/" + safe);
        Files.write(file.toPath(), "safe".getBytes());
    }
}
