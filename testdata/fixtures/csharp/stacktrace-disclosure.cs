// stacktrace-disclosure: the developer exception page prints stack traces
// to the client. Only enable it inside an IsDevelopment gate.
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;

namespace Fixture {
    public class Startup {
        public void Vuln(IApplicationBuilder app) {
            // ruleid: stacktrace-disclosure
            app.UseDeveloperExceptionPage();
        }

        public void Vuln2(IApplicationBuilder app) {
        // ruleid: stacktrace-disclosure
            app.UseDeveloperExceptionPage(new object());
            app.UseRouting();
        }

        // ok: stacktrace-disclosure
        public void Safe(IApplicationBuilder app, IHostEnvironment env) {
            if (env.IsDevelopment()) {
                app.UseDeveloperExceptionPage();
            }
        }

        // ok: stacktrace-disclosure
        public void Plain(IApplicationBuilder app) {
            app.UseRouting();
        }
    }
}
