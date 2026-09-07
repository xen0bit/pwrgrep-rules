import org.yaml.snakeyaml.Yaml;

public class SnakeyamlCtor {
    public void vuln(String doc) {
        // ruleid: use-snakeyaml-constructor
        Yaml yaml = new org.yaml.snakeyaml.Yaml();
        yaml.load(doc);
    }

    public void vulnAgain(String doc) {
        // ruleid: use-snakeyaml-constructor
        Yaml yaml = new org.yaml.snakeyaml.Yaml();
        yaml.load(doc);
    }

    public void vulnThird(String doc) {
        // ruleid: use-snakeyaml-constructor
        Yaml yaml = new org.yaml.snakeyaml.Yaml();
        yaml.load(doc);
    }

    public void safe(String doc) {
        Yaml yaml = new org.yaml.snakeyaml.Yaml(new org.yaml.snakeyaml.constructor.SafeConstructor());
        // ok: use-snakeyaml-constructor
        yaml.load(doc);
    }

    public void plain(String doc) {
        // ok: use-snakeyaml-constructor
        System.out.println(doc);
    }

    public void helper() {
        // ok: use-snakeyaml-constructor
        System.out.println("load in a comment is not a call");
    }
}
