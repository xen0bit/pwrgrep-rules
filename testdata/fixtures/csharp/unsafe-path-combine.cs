// unsafe-path-combine: Path.Combine with a request-derived segment lets
// `../` escape the base directory. Check the name with GetFileName first.
using System.IO;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class Files : Controller {
        public string Read(string name) {
            // ruleid: unsafe-path-combine
            return File.ReadAllText(Path.Combine("/data", name));
        }

        public void Write(string name, string content) {
            string target = Path.Combine("/data", name);
            // ruleid: unsafe-path-combine
            File.WriteAllText(target, content);
        }

        public string SafeRead(string name) {
            string safe = Path.GetFileName(name);
            // ok: unsafe-path-combine
            return File.ReadAllText(Path.Combine("/data", safe));
        }

        // ok: unsafe-path-combine
        public string Constant() {
            return File.ReadAllText(Path.Combine("/data", "fixed.txt"));
        }
    }
}
