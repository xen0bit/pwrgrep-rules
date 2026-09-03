package fixture;

// CWE-390: the exception was caught and then nothing happened.
//
// An empty catch block is a decision written as an absence. The program
// carries on with whatever state the failed operation left behind - a null, a
// half-written file, a connection that never opened - and the reason it went
// wrong is gone. When the consequence turns up, three frames later and in a
// different method, there is nothing in the log connecting the two.
//
// Only a *completely* empty block is reported. A comment in there is somebody
// saying why, and the corpus's bias is to believe them: `// best effort` and
// `// the file may not exist` are decisions, and reporting them is how a rule
// teaches people to skip it. The two-character difference is the whole test.

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

class Cwe390 {

    void deleteQuietly(File file) {
        try {
            Files.delete(file.toPath());
            // ruleid: java-exception-swallowed
        } catch (IOException e) {
        }
    }

    int parseOrZero(String text) {
        int value = 0;
        try {
            value = Integer.parseInt(text);
            // ruleid: java-exception-swallowed
        } catch (NumberFormatException e) {
        }
        return value;
    }

    // Someone said why, so the rule stops asking.
    void deleteBestEffort(File file) {
        try {
            Files.delete(file.toPath());
            // ok: java-exception-swallowed
        } catch (IOException e) {
            // best effort: the caller is about to overwrite it anyway
        }
    }

    // Handled is handled.
    int parseOrDefault(String text, int fallback) {
        try {
            return Integer.parseInt(text);
            // ok: java-exception-swallowed
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
