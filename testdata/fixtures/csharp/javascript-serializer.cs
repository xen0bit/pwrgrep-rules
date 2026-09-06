// insecure-javascriptserializer-deserialization: SimpleTypeResolver lets the
// payload name any type to instantiate. Do not combine it with untrusted JSON.
using System.Web.Script.Serialization;

namespace Fixture {
    public class Import {
        public void ReadVuln(string json) {
            // ruleid: insecure-javascriptserializer-deserialization
            new JavaScriptSerializer(new SimpleTypeResolver());
        }

        public void ReadVuln2(string json) {
        // ruleid: insecure-javascriptserializer-deserialization
            new JavaScriptSerializer(new SimpleTypeResolver());
        }

        // ok: insecure-javascriptserializer-deserialization
        public void ReadSafe(string json) {
            var s = new JavaScriptSerializer();
            s.DeserializeObject(json);
        }

        // ok: insecure-javascriptserializer-deserialization
        public void Plain(string json) {
            json.Trim();
        }
    }
}
