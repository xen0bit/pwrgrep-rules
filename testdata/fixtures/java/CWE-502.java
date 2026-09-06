package fixture;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import javax.servlet.http.HttpServletRequest;

class Cwe502 {

    Object viaReadObject(HttpServletRequest request) throws Exception {
        InputStream in = request.getInputStream();
        // ruleid: java-insecure-deserialization
        return new ObjectInputStream(in).readObject();
    }

    Object viaParameter(HttpServletRequest request) throws Exception {
        String data = request.getParameter("data");
        java.io.ByteArrayInputStream bais = new java.io.ByteArrayInputStream(data.getBytes());
        // ruleid: java-insecure-deserialization
        return new ObjectInputStream(bais).readObject();
    }

    void viaHeader(HttpServletRequest request) throws Exception {
        String encoded = request.getHeader("X-Data");
        java.io.ByteArrayInputStream in = new java.io.ByteArrayInputStream(encoded.getBytes());
        // ruleid: java-insecure-deserialization
        new ObjectInputStream(in).readObject();
    }

    Object viaDirect(HttpServletRequest request) throws Exception {
        // ruleid: java-insecure-deserialization
        return new ObjectInputStream(request.getInputStream()).readObject();
    }

    // ok: java-insecure-deserialization
    Object safeConstant() throws Exception {
        FileInputStream fis = new FileInputStream("/tmp/data.bin");
        ObjectInputStream ois = new ObjectInputStream(fis);
        return ois.readObject();
    }

    // ok: java-insecure-deserialization
    void safeNoReadObject() throws Exception {
        FileInputStream fis = new FileInputStream("/tmp/data.bin");
        new ObjectInputStream(fis);
    }

    void safeFromConfig(String path) throws Exception {
        FileInputStream fis = new FileInputStream(path);
        ObjectInputStream ois = new ObjectInputStream(fis);
        // ok: java-insecure-deserialization
        ois.readObject();
    }
}
