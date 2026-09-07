// insecure-soapformatter-deserialization: SoapFormatter deserializes
// attacker-controlled type information. Use a safe serializer instead.
using System.IO;
using System.Runtime.Serialization.Formatters.Soap;

namespace Fixture {
    public class Import {
        public void ReadVuln(Stream s) {
            // ruleid: insecure-soapformatter-deserialization
            new SoapFormatter();
        }

        public void ReadVuln2(Stream s) {
        // ruleid: insecure-soapformatter-deserialization
            new SoapFormatter();
        }

        // ok: insecure-soapformatter-deserialization
        public void ReadSafe(Stream s) {
            var r = new StreamReader(s);
            r.ReadToEnd();
        }

        // ok: insecure-soapformatter-deserialization
        public void NoFormatter(Stream s) {
            s.ReadByte();
        }
    }
}
