import javax.ws.rs.PathParam;
import java.io.File;

public class RsTraversal {
    // ruleid: jax-rs-path-traversal
    public File get(@PathParam("name") String name) {
        return new File("/base", name);
    }

    // ruleid: jax-rs-path-traversal
    public File read(@PathParam("id") String id) {
        return new File("/base", id);
    }

    // ruleid: jax-rs-path-traversal
    public File fetch(@javax.ws.rs.PathParam("key") String key) {
        return new File("/base", key);
    }

    // ok: jax-rs-path-traversal
    public File safe() {
        return new File("/base", "static");
    }

    // ok: jax-rs-path-traversal
    public String plain(String name) {
        return "hello " + name;
    }

    // ok: jax-rs-path-traversal
    public File noParam() {
        return new File("/base");
    }
}
