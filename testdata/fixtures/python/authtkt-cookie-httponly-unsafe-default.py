# Pyramid AuthTkt cookie without httponly (unsafe default).
#
# Without httponly, scripts can read the auth cookie (XSS becomes
# session theft). Passing httponly=True (or **options) is the fix, and
# its call line is the ok. The finding focuses the call arguments.
import pyramid.authentication


# ruleid: pyramid-authtkt-cookie-httponly-unsafe-default
policy_a = pyramid.authentication.AuthTktAuthenticationPolicy("secret")

# ruleid: pyramid-authtkt-cookie-httponly-unsafe-default
policy_b = pyramid.authentication.AuthTktCookieHelper("secret")

# ruleid: pyramid-authtkt-cookie-httponly-unsafe-default
policy_c = pyramid.authentication.AuthTktAuthenticationPolicy("secret", timeout=600)

# ok: pyramid-authtkt-cookie-httponly-unsafe-default
policy_ok = pyramid.authentication.AuthTktAuthenticationPolicy("secret", httponly=True)

# ok: pyramid-authtkt-cookie-httponly-unsafe-default
opts = {"httponly": True}
# ok: pyramid-authtkt-cookie-httponly-unsafe-default
policy_opts = pyramid.authentication.AuthTktAuthenticationPolicy("secret", **opts)
