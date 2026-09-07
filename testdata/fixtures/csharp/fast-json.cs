// insecure-fastjson-deserialization: BadListTypeChecking = false lets the
// payload's $type extension name arbitrary types. Leave it on for public input.
using fastJSON;

namespace Fixture {
    public class Import {
        public void ReadVuln(string json) {
            // ruleid: insecure-fastjson-deserialization
            var p = new JSONParameters
            {
                BadListTypeChecking = false
            };
            JSON.ToObject(json, p);
        }

        public void ReadVuln2(string json) {
        // ruleid: insecure-fastjson-deserialization
            JSON.ToObject(json, new JSONParameters
            {
                BadListTypeChecking = false
            });
        }

        // ok: insecure-fastjson-deserialization
        public void ReadSafe(string json) {
            var p = new JSONParameters
            {
                BadListTypeChecking = true
            };
            JSON.ToObject(json, p);
        }

        // ok: insecure-fastjson-deserialization
        public void Plain(string json) {
            JSON.ToObject(json);
        }
    }
}
