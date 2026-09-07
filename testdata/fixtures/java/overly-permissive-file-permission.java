public class PermissivePerms {
    public void vuln(java.nio.file.Path f) throws Exception {
        java.util.Set<java.nio.file.attribute.PosixFilePermission> perms = new java.util.HashSet<>();
        // ruleid: overly-permissive-file-permission
        perms.add(java.nio.file.attribute.PosixFilePermission.OTHERS_READ);
        java.nio.file.Files.setPosixFilePermissions(f, perms);
    }

    public void vulnAgain(java.nio.file.Path f) throws Exception {
        java.util.Set<java.nio.file.attribute.PosixFilePermission> perms = new java.util.HashSet<>();
        // ruleid: overly-permissive-file-permission
        perms.add(java.nio.file.attribute.PosixFilePermission.OTHERS_WRITE);
        java.nio.file.Files.setPosixFilePermissions(f, perms);
    }

    public void vulnThird(java.nio.file.Path f) throws Exception {
        java.util.Set<java.nio.file.attribute.PosixFilePermission> perms = new java.util.HashSet<>();
        // ruleid: overly-permissive-file-permission
        perms.add(java.nio.file.attribute.PosixFilePermission.OTHERS_EXECUTE);
        java.nio.file.Files.setPosixFilePermissions(f, perms);
    }

    public void safe(java.nio.file.Path f) throws Exception {
        java.util.Set<java.nio.file.attribute.PosixFilePermission> perms = new java.util.HashSet<>();
        // ok: overly-permissive-file-permission
        perms.add(java.nio.file.attribute.PosixFilePermission.OWNER_READ);
        java.nio.file.Files.setPosixFilePermissions(f, perms);
    }

    public void plain(java.nio.file.Path f) {
        // ok: overly-permissive-file-permission
        System.out.println(f);
    }

    public void helper() {
        // ok: overly-permissive-file-permission
        System.out.println("setPosixFilePermissions in a comment is not a call");
    }
}
