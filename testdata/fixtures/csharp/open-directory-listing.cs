// open-directory-listing: UseDirectoryBrowser serves the file list to
// anyone who asks. Turn it off where users browse.
using Microsoft.AspNetCore.Builder;

namespace Fixture {
    public class VulnStartup {
        public void Configure(IApplicationBuilder app) {
            // ruleid: open-directory-listing
            app.UseDirectoryBrowser();
        }
    }

    public class Vuln2Startup {
        public void Configure(IApplicationBuilder app) {
            app.UseStaticFiles();
            // ruleid: open-directory-listing
            app.UseDirectoryBrowser();
        }
    }

    public class SafeStartup {
        // ok: open-directory-listing
        public void Configure(IApplicationBuilder app) {
            app.UseStaticFiles();
        }
    }
}
