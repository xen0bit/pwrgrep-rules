using System.Data.SqlClient;

namespace Fixture {
    public class Settings {
        // ruleid: csharp-credential-is-a-literal
        private const string Password = "hunter2";
        // A property with an initialiser is out of reach; see the rule header.
        // ok: csharp-credential-is-a-literal
        public string ApiSecret { get; set; } = "sk_live_9c3f11a2b7";

        // ok: csharp-credential-is-a-literal
        private const string PasswordFieldName = "password";
        // ok: csharp-credential-is-a-literal
        private const string AuthHeader = "Proxy-Authorization";
        // ok: csharp-credential-is-a-literal
        private const string PasswordPlaceholder = "";
        // ok: csharp-credential-is-a-literal
        private static readonly string Password2 = Environment.GetEnvironmentVariable("PW");

        public SqlConnection Open() {
            // ruleid: csharp-credential-is-a-literal
            var token = "ghp_A1b2C3d4E5f6G7h8I9j0K1l2M3n4O5p6Q7r8";
            return new SqlConnection("Server=.;User Id=sa;Password=s3cr3t!");
        }

        public void Use(string password) {
            // ok: csharp-credential-is-a-literal
            var label = "Password:";
        }
    }
}
