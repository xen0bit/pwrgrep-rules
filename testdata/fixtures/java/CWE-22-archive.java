package fixture;

// CWE-22, the archive half: an entry name is chosen by whoever built the zip.
//
// A zip entry's name is a string in the archive, and nothing in the format
// forbids `../../../../home/app/.ssh/authorized_keys`. Extract with
// `new File(destination, entry.getName())` and the file lands wherever the
// archive said, which is how Zip Slip took a few thousand projects in 2018.
//
// The safe shape is to build the path, canonicalise it, and refuse it if it
// does not start with the destination - and the refusal comes *after* the
// construction, so no reading of the two statements in order can tell the
// checked case from the unchecked one. The test is therefore the whole method
// read as text: a method that mentions `getCanonicalPath` or `startsWith` has
// had someone think about this, and is left alone.
//
// This is a separate fixture from CWE-22.java because it is a separate
// source. The request rule follows a servlet parameter; this one follows the
// archive, and a program can be wrong about one and right about the other.

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;

class Cwe22Archive {

    void extractAll(ZipInputStream zis, File destination) throws IOException {
        ZipEntry entry;
        while ((entry = zis.getNextEntry()) != null) {
            // ruleid: java-zip-entry-escapes-its-directory
            File out = new File(destination, entry.getName());
            out.getParentFile().mkdirs();
        }
    }

    // The loop variable is bound by the for, which is an assignment whose node
    // wraps the body that uses it.
    void extractEach(ZipFile archive, Path destination) throws IOException {
        for (ZipEntry entry : java.util.Collections.list(archive.entries())) {
            // ruleid: java-zip-entry-escapes-its-directory
            Path out = destination.resolve(entry.getName());
            out.toFile().getParentFile().mkdirs();
        }
    }

    void extractOne(ZipInputStream zis, File destination) throws IOException {
        ZipEntry entry = zis.getNextEntry();
        // ruleid: java-zip-entry-escapes-its-directory
        FileOutputStream out = new FileOutputStream(new File(destination, entry.getName()));
        out.close();
    }

    // Built, canonicalised, and refused if it left the directory.
    void extractChecked(ZipInputStream zis, File destination) throws IOException {
        ZipEntry entry;
        while ((entry = zis.getNextEntry()) != null) {
            // ok: java-zip-entry-escapes-its-directory
            File out = new File(destination, entry.getName());
            if (!out.getCanonicalPath().startsWith(destination.getCanonicalPath())) {
                throw new IOException("entry outside destination: " + entry.getName());
            }
            out.getParentFile().mkdirs();
        }
    }

    // A name the program chose is not a name the archive chose.
    void writeReport(File destination) throws IOException {
        // ok: java-zip-entry-escapes-its-directory
        File out = new File(destination, "report.txt");
        out.createNewFile();
    }
}
