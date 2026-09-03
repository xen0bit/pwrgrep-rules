using Microsoft.Extensions.Logging;

namespace Fixture {
    public class Auth {
        private readonly ILogger<Auth> _log;

        public void SignIn(string user, string password) {
            // ruleid: csharp-credential-written-to-the-log
            _log.LogInformation("signing in {User} with {Password}", user, password);
        }

        public void Refresh(string accessToken) {
            // ruleid: csharp-credential-written-to-the-log
            _log.LogDebug($"refreshing {accessToken}");
        }

        public void Connect(string connectionString) {
            // ruleid: csharp-credential-written-to-the-log
            System.Console.WriteLine("connecting: " + connectionString);
        }

        public void Ok(string user) {
            // ok: csharp-credential-written-to-the-log
            _log.LogInformation("signing in {User}", user);
        }

        public void AlsoOk(string password) {
            // ok: csharp-credential-written-to-the-log
            _log.LogInformation("password check complete");
        }
    }
}
