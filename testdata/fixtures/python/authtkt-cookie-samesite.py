# Pyramid AuthTkt cookie with samesite other than Lax.
#
# Only 'Lax' is accepted (single-quoted, as the rule spells it); any
# other value leaves the cookie on cross-site requests. The finding
# lands on the call line.
import pyramid.authentication


# ruleid: pyramid-authtkt-cookie-samesite
policy_a = pyramid.authentication.AuthTktAuthenticationPolicy("secret", samesite="None")

# ruleid: pyramid-authtkt-cookie-samesite
policy_b = pyramid.authentication.AuthTktCookieHelper("secret", samesite="Strict")

# ruleid: pyramid-authtkt-cookie-samesite
policy_c = pyramid.authentication.AuthTktAuthenticationPolicy("s", samesite="None", timeout=1)

# ok: pyramid-authtkt-cookie-samesite
policy_ok = pyramid.authentication.AuthTktAuthenticationPolicy("secret", samesite='Lax')

# ok: pyramid-authtkt-cookie-samesite
policy_ok2 = pyramid.authentication.AuthTktCookieHelper("secret", samesite='Lax')

# ok: pyramid-authtkt-cookie-samesite
policy_plain = pyramid.authentication.AuthTktAuthenticationPolicy("secret")
