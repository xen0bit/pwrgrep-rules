// CWE-502: Deserialization of untrusted data — attacker chooses types.
// BinaryFormatter or JsonConvert.DeserializeObject on request data lets
// an attacker instantiate arbitrary types. The rule flags those calls;
// fix by avoiding them or using safe serializers with type allow-lists.
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class DeserializationController : Controller {
        public IActionResult BinaryFromQuery() {
            Stream body = Request.Body;
            var formatter = new BinaryFormatter();
            // ruleid: csharp-deserialization
            var obj = formatter.Deserialize(body);
            return Ok(obj);
        }

        public IActionResult JsonFromForm() {
            string payload = Request.Form["payload"];
            // ruleid: csharp-deserialization
            var obj = JsonConvert.DeserializeObject(payload);
            return Ok(obj);
        }

        public IActionResult JsonTyped(string json) {
            // ruleid: csharp-deserialization
            var obj = JsonConvert.DeserializeObject<object>(json);
            return Ok(obj);
        }

        public IActionResult HeaderPayload() {
            string h = Request.Headers["X-Payload"];
            // ruleid: csharp-deserialization
            var obj2 = JsonConvert.DeserializeObject(h);
            return Ok(obj2);
        }

        public IActionResult QueryStringPayload() {
            string d = Request.QueryString["d"];
            // ruleid: csharp-deserialization
            var result = JsonConvert.DeserializeObject<dynamic>(d);
            return Ok(result);
        }

        public IActionResult Safe() {
            string fixedJson = "{\"name\":\"alice\"}";
            // ok: csharp-deserialization
            var obj = JsonConvert.DeserializeObject(fixedJson);
            return Ok(obj);
        }

        public IActionResult SafeTyped() {
            var safe = new MemoryStream(new byte[] { 1, 2, 3 });
            var formatter = new BinaryFormatter();
            // ok: csharp-deserialization
            // safe source not from request - internal resource
            var obj = formatter.Deserialize(new MemoryStream(File.ReadAllBytes("/tmp/data.bin")));
            return Ok(obj);
        }
    }
}
