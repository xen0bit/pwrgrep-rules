// jwt-tokenvalidationparameters-no-expiry-validation: switching lifetime
// validation off accepts expired tokens forever. Leave it on and set a
// ClockSkew instead.
using Microsoft.IdentityModel.Tokens;

namespace Fixture {
    public class Auth {
        public TokenValidationParameters Vuln() {
            return new TokenValidationParameters {
                // ruleid: jwt-tokenvalidationparameters-no-expiry-validation
                ValidateLifetime = false
            };
        }

        public TokenValidationParameters Vuln2() {
            return new TokenValidationParameters {
            // ruleid: jwt-tokenvalidationparameters-no-expiry-validation
                RequireExpirationTime = false
            };
        }

        // ok: jwt-tokenvalidationparameters-no-expiry-validation
        public TokenValidationParameters Safe() {
            return new TokenValidationParameters {
                ValidateLifetime = true
            };
        }

        // ok: jwt-tokenvalidationparameters-no-expiry-validation
        public TokenValidationParameters Plain() {
            return new TokenValidationParameters {
                ValidateIssuer = true
            };
        }
    }
}
