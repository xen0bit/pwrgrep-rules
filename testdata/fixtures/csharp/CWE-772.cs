using System.IO;

namespace Fixture {
    public class Files {
        public string Read(string path) {
            // ruleid: csharp-stream-never-closed
            var fs = new FileStream(path, FileMode.Open);
            var buf = new byte[16];
            fs.Read(buf, 0, buf.Length);
            return System.Text.Encoding.UTF8.GetString(buf);
        }

        public void Write(string path, string text) {
            // ruleid: csharp-stream-never-closed
            var w = new StreamWriter(path);
            w.Write(text);
        }

        public string Using(string path) {
            // ok: csharp-stream-never-closed
            using (var r = new StreamReader(path)) {
                return r.ReadToEnd();
            }
        }

        public string Declaration(string path) {
            // ok: csharp-stream-never-closed
            using var r = new StreamReader(path);
            return r.ReadToEnd();
        }

        public void Disposed(string path) {
            // ok: csharp-stream-never-closed
            var fs = new FileStream(path, FileMode.Open);
            fs.Dispose();
        }

        public FileStream Handed(string path) {
            // ok: csharp-stream-never-closed
            var fs = new FileStream(path, FileMode.Open);
            return fs;
        }
    }
}
