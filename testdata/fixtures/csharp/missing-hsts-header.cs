// missing-hsts-header: without the HSTS header the browser keeps speaking
// plain HTTP where it can. Call UseHsts (and AddHsts) in startup.
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

namespace Fixture {
    public class VulnStartup {
        // ruleid: missing-hsts-header
        public void Configure(IApplicationBuilder app) {
            app.UseRouting();
        }

        // ruleid: missing-hsts-header
        public void ConfigureServices(IServiceCollection services) {
            services.AddRouting();
        }
    }

    public class SafeStartup {
        // ok: missing-hsts-header
        public void Configure(IApplicationBuilder app) {
            app.UseHsts();
        }

        // ok: missing-hsts-header
        public void ConfigureServices(IServiceCollection services) {
            services.AddHsts(o => o.MaxAge = System.TimeSpan.FromDays(365));
        }
    }
}
