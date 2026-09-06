// structured-logging: an interpolated log message folds the values into the
// template, so log analysis cannot tell fields apart. Pass values as
// arguments to the template instead.
using Microsoft.Extensions.Logging;

namespace Fixture {
    public class Orders {
        private readonly ILogger<Orders> log;
        public Orders(ILogger<Orders> logger) {
            log = logger;
        }

        public void Vuln(string name) {
            // ruleid: structured-logging
            log.LogInformation($"user {name} checked out");
        }

        public void Vuln2(string id) {
        // ruleid: structured-logging
            log.LogError($"order {id} failed");
        }

        // ok: structured-logging
        public void Safe(string name) {
            log.LogInformation("user {name} checked out", name);
        }

        // ok: structured-logging
        public void Plain() {
            log.LogInformation("checkout done");
        }
    }
}
