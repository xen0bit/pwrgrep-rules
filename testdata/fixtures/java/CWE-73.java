package fixture;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FilenameUtils;

class Cwe73 {

    InputStream viaFile(HttpServletRequest request) throws Exception {
        String name = request.getParameter("file");
        // ruleid: java-path-traversal
        File f = new File("/srv/uploads", name);
        return null;
    }

    InputStream viaFileCtor(HttpServletRequest request) throws Exception {
        String path = request.getHeader("X-Path");
        // ruleid: java-path-traversal
        return new FileInputStream(path);
    }

    byte[] viaPaths(HttpServletRequest request) throws Exception {
        String p = request.getQueryString();
        // ruleid: java-path-traversal
        Path full = Paths.get("/var/data", p);
        return Files.readAllBytes(full);
    }

    Path viaResolve(HttpServletRequest request) throws Exception {
        String name = request.getParameter("name");
        Path base = Paths.get("/srv/files");
        // ruleid: java-path-traversal
        Path resolved = base.resolve(name);
        return resolved;
    }

    // ok: java-path-traversal
    InputStream safeBase(HttpServletRequest request) throws Exception {
        String name = request.getParameter("file");
        String safe = FilenameUtils.getName(name);
        File f = new File("/srv/uploads", safe);
        return new FileInputStream(f);
    }

    // ok: java-path-traversal
    InputStream safeConstant() throws Exception {
        return new FileInputStream("/etc/app/config.yaml");
    }

    InputStream safeConfigured(String cfg) throws Exception {
        // ok: java-path-traversal
        return new FileInputStream(cfg);
    }
}
