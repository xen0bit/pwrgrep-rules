package fixture;

// CWE-22: the request decides which file is opened.
//
// A servlet parameter is a string, and `new File(base, name)` is happy to be
// handed `../../../etc/shadow` - Java resolves the traversal for you and the
// resulting File is outside the directory the program meant. Nothing in the
// type system says otherwise, because a path is a String all the way down.
//
// The sources here are the request and nothing else. A path from a properties
// file or a command-line argument is chosen by whoever runs the program, and
// mixing the two buries the one that matters.
//
// `getFileName()` and `FilenameUtils.getName()` are named as sanitizers
// because after them there is one path component and no separator left, which
// is a thing a rule can check. `normalize()` is deliberately not one: it
// resolves `..` rather than rejecting it, so a normalized path is still
// outside the directory - it just says so more tidily.

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FilenameUtils;

class Cwe22 {

    private static final File UPLOADS = new File("/srv/uploads");

    InputStream download(HttpServletRequest request) throws IOException {
        String name = request.getParameter("file");
        // ruleid: java-path-from-untrusted-input
        File wanted = new File(UPLOADS, name);
        return new FileInputStream(wanted);
    }

    byte[] readHeader(HttpServletRequest request) throws IOException {
        String name = request.getHeader("X-Report");
        // ruleid: java-path-from-untrusted-input
        Path path = Paths.get("/var/reports", name);
        return Files.readAllBytes(path);
    }

    // A multi-valued parameter arrives through a loop, which is an assignment
    // whose body uses the name it binds.
    void deleteAll(HttpServletRequest request) {
        for (String name : request.getParameterValues("doomed")) {
            // ruleid: java-path-from-untrusted-input
            File doomed = new File("/srv/uploads/" + name);
            doomed.delete();
        }
    }

    InputStream openResolved(HttpServletRequest request) throws IOException {
        String name = request.getParameter("file");
        // ruleid: java-path-from-untrusted-input
        Path path = UPLOADS.toPath().resolve(name);
        return Files.newInputStream(path);
    }

    // One component and no separator is a name, not a path.
    InputStream downloadSafely(HttpServletRequest request) throws IOException {
        String name = FilenameUtils.getName(request.getParameter("file"));
        // ok: java-path-from-untrusted-input
        File wanted = new File(UPLOADS, name);
        return new FileInputStream(wanted);
    }

    // Chosen by whoever deployed this, not by whoever called it.
    InputStream openConfigured(String configuredPath) throws IOException {
        // ok: java-path-from-untrusted-input
        return new FileInputStream(configuredPath);
    }
}
