package fixture;

// CWE-772: opened, used, and left to the garbage collector.
//
// A Java stream holds a file descriptor and the descriptor is not memory, so
// nothing about running low on it makes the collector run. A server that
// leaks one per request stops being able to open files or accept connections
// after a few thousand of them, and the failure arrives as
// `Too many open files` in an unrelated part of the program.
//
// Java has an answer to this and it is try-with-resources, which closes on
// every path out of the block including the exceptional ones. A resource
// declared in a `try (...)` header is a different node in the grammar from a
// local variable, so it is not matched here at all and needs no subtraction.
//
// Two things are subtracted. A method that mentions `close` anywhere has had
// someone think about this, including the `finally` blocks that predate
// try-with-resources. And a stream that is returned belongs to the caller
// now, which is the same trade go-response-body-not-closed makes.

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.Socket;

class Cwe772 {

    int firstByte(File file) throws IOException {
        // ruleid: java-stream-never-closed
        FileInputStream stream = new FileInputStream(file);
        return stream.read();
    }

    String firstLine(File file) throws IOException {
        // ruleid: java-stream-never-closed
        BufferedReader reader = new BufferedReader(new FileReader(file));
        return reader.readLine();
    }

    void ping(String host) throws IOException {
        // ruleid: java-stream-never-closed
        Socket socket = new Socket(host, 80);
        socket.getOutputStream().write('x');
    }

    // Closed on every path out of the block, which is what the construct is
    // for.
    int firstByteSafely(File file) throws IOException {
        // ok: java-stream-never-closed
        try (FileInputStream stream = new FileInputStream(file)) {
            return stream.read();
        }
    }

    // The older spelling, and someone thought about it.
    int firstByteInAFinally(File file) throws IOException {
        // ok: java-stream-never-closed
        FileInputStream stream = new FileInputStream(file);
        try {
            return stream.read();
        } finally {
            stream.close();
        }
    }

    // Handed to the caller, whose problem it now is.
    FileInputStream open(File file) throws IOException {
        // ok: java-stream-never-closed
        FileInputStream stream = new FileInputStream(file);
        return stream;
    }
}
