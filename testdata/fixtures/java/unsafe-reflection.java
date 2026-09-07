public class UnsafeReflection {
    public void vuln(String name) throws Exception {
        // ruleid: unsafe-reflection
        Class.forName(name);
    }

    public void vulnAgain(String name) throws Exception {
        // ruleid: unsafe-reflection
        Class.forName(name);
    }

    public void vulnThird(String name, boolean init, ClassLoader loader) throws Exception {
        // ruleid: unsafe-reflection
        Class.forName(name, init, loader);
    }

    public Class<?> safe(Class<?> clazz) {
        // ok: unsafe-reflection
        return clazz;
    }

    public int plain(int x) {
        // ok: unsafe-reflection
        return x + 1;
    }

    public boolean check(Object o) {
        // ok: unsafe-reflection
        return o instanceof String;
    }
}
