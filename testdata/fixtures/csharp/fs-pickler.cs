// insecure-fspickler-deserialization: the FsPickler JSON serializer restores
// arbitrary .NET objects from the payload. Do not use it for untrusted input.
using MBrace.FsPickler.Json;

namespace Fixture {
    public class Import {
        public void ReadVuln(string json) {
            // ruleid: insecure-fspickler-deserialization
            var s = FsPickler.CreateJsonSerializer();
            s.UnPickleOfString<string>(json);
        }

        public void ReadVuln2(string json) {
        // ruleid: insecure-fspickler-deserialization
            FsPickler.CreateJsonSerializer();
        }

        // ok: insecure-fspickler-deserialization
        public void ReadSafe(string json) {
            var s = FsPickler.CreateBinarySerializer();
            s.UnPickleOfString<string>(json);
        }

        // ok: insecure-fspickler-deserialization
        public void Plain(string json) {
            json.Trim();
        }
    }
}
