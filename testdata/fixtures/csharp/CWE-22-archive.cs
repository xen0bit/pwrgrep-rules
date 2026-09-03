using System.IO;
using System.IO.Compression;

namespace Fixture {
    public class Unpacker {
        public void Extract(string archivePath, string outDir) {
            using (var zip = ZipFile.OpenRead(archivePath)) {
                foreach (var entry in zip.Entries) {
                    string name = entry.FullName;
                    // ruleid: csharp-zip-entry-escapes-its-directory
                    var target = Path.Combine(outDir, name);
                    entry.ExtractToFile(target, true);
                }
            }
        }

        public void ExtractDirect(string archivePath, string outDir) {
            using (var zip = ZipFile.OpenRead(archivePath)) {
                foreach (var entry in zip.Entries) {
                    // ruleid: csharp-zip-entry-escapes-its-directory
                    entry.ExtractToFile(Path.Combine(outDir, entry.FullName), true);
                }
            }
        }

        public void Checked(string archivePath, string outDir) {
            using (var zip = ZipFile.OpenRead(archivePath)) {
                foreach (var entry in zip.Entries) {
                    string leaf = Path.GetFileName(entry.FullName);
                    // ok: csharp-zip-entry-escapes-its-directory
                    var target = Path.Combine(outDir, leaf);
                    entry.ExtractToFile(target, true);
                }
            }
        }
    }
}
