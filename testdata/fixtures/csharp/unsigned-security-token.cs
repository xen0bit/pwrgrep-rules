// unsigned-security-token: RequireSignedTokens = false accepts tokens with
// the signature stripped. Leave the default on so forgeries fail validation.
using Microsoft.IdentityModel.Tokens;

namespace Fixture {
    public class Auth {
        public TokenValidationParameters Vuln() {
            return new TokenValidationParameters {
                // ruleid: unsigned-security-token
                RequireSignedTokens = false
            };
        }

        public TokenValidationParameters Vuln2() {
            var p = new TokenValidationParameters {
                ValidateIssuer = true,
                // ruleid: unsigned-security-token
                RequireSignedTokens = false
            };
            return p;
        }

        // ok: unsigned-security-token
        public TokenValidationParameters Safe() {
            return new TokenValidationParameters {
                RequireSignedTokens = true
            };
        }

        // ok: unsigned-security-token
        public TokenValidationParameters Plain() {
            return new TokenValidationParameters {
                ValidateIssuer = true
            };
        }
    }
}
