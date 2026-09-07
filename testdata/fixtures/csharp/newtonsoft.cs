// insecure-newtonsoft-deserialization: TypeNameHandling.All (and Auto,
// Objects, Arrays) lets the payload name arbitrary types. Leave handling off
// for untrusted JSON.
using Newtonsoft.Json;

namespace Fixture {
    public class Json {
        public void Vuln(string payload) {
            var settings = new JsonSerializerSettings {
                // ruleid: insecure-newtonsoft-deserialization
                TypeNameHandling = TypeNameHandling.All
            };
            JsonConvert.DeserializeObject(payload, settings);
        }

        public void Vuln2(string payload) {
            var settings = new JsonSerializerSettings {
            // ruleid: insecure-newtonsoft-deserialization
                TypeNameHandling = TypeNameHandling.Objects
            };
            var o = JsonConvert.DeserializeObject(payload, settings);
            Use(o);
        }

        // ok: insecure-newtonsoft-deserialization
        public void Safe(string payload) {
            var settings = new JsonSerializerSettings {
                TypeNameHandling = TypeNameHandling.None
            };
            var o = JsonConvert.DeserializeObject(payload, settings);
            Use(o);
        }

        // ok: insecure-newtonsoft-deserialization
        public void Plain(string payload) {
            var o = JsonConvert.DeserializeObject(payload);
            Use(o);
        }

        private void Use(object o) {
        }
    }
}
