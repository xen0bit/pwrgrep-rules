// insecure-binaryformatter-deserialization: BinaryFormatter executes
// attacker-controlled type information on Deserialize. Use a safe
// serializer (XmlSerializer, JsonSerializer) instead.
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;

namespace Fixture {
    public class Import {
        public void ReadVuln(Stream s) {
            // ruleid: insecure-binaryformatter-deserialization
            new BinaryFormatter();
        }

        public void ReadVuln2(Stream s) {
        // ruleid: insecure-binaryformatter-deserialization
            new BinaryFormatter();
        }

        // ok: insecure-binaryformatter-deserialization
        public void ReadSafe(Stream s) {
            var x = new XmlSerializer(typeof(string));
            x.Deserialize(s);
        }

        // ok: insecure-binaryformatter-deserialization
        public void NoFormatter(Stream s) {
            s.ReadByte();
        }
    }
}
