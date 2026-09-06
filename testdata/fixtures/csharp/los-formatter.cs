// insecure-losformatter-deserialization: LosFormatter trusts the view-state
// payload, which the client controls. Do not use it for untrusted input.
using System.IO;
using System.Web.UI;

namespace Fixture {
    public class Import {
        public void ReadVuln(Stream s) {
            // ruleid: insecure-losformatter-deserialization
            new LosFormatter();
        }

        public void ReadVuln2(Stream s) {
        // ruleid: insecure-losformatter-deserialization
            new LosFormatter();
        }

        // ok: insecure-losformatter-deserialization
        public void ReadSafe(Stream s) {
            var r = new StreamReader(s);
            r.ReadToEnd();
        }

        // ok: insecure-losformatter-deserialization
        public void NoFormatter(Stream s) {
            s.ReadByte();
        }
    }
}
