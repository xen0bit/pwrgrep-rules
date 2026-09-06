// insecure-netdatacontract-deserialization: NetDataContractSerializer shares
// BinaryFormatter's trust in the payload's type names. Do not use it for
// untrusted input.
using System.IO;
using System.Runtime.Serialization;

namespace Fixture {
    public class Import {
        public void ReadVuln(Stream s) {
            // ruleid: insecure-netdatacontract-deserialization
            new NetDataContractSerializer();
        }

        public void ReadVuln2(Stream s) {
        // ruleid: insecure-netdatacontract-deserialization
            new NetDataContractSerializer();
        }

        // ok: insecure-netdatacontract-deserialization
        public void ReadSafe(Stream s) {
            var r = new StreamReader(s);
            r.ReadToEnd();
        }

        // ok: insecure-netdatacontract-deserialization
        public void NoFormatter(Stream s) {
            s.ReadByte();
        }
    }
}
