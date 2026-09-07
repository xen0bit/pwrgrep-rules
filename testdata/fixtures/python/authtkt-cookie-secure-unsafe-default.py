# Pyramid AuthTkt cookie without secure (unsafe default).
#
# Without secure the auth cookie travels over http. Passing secure=True
# (or **options) is the fix, and its call line is the ok.
import pyramid.authentication


# ruleid: pyramid-authtkt-cookie-secure-unsafe-default
policy_a = pyramid.authentication.AuthTktAuthenticationPolicy("secret")

# ruleid: pyramid-authtkt-cookie-secure-unsafe-default
policy_b = pyramid.authentication.AuthTktCookieHelper("secret")

# ruleid: pyramid-authtkt-cookie-secure-unsafe-default
policy_c = pyramid.authentication.AuthTktAuthenticationPolicy("secret", timeout=600)

# ok: pyramid-authtkt-cookie-secure-unsafe-default
policy_ok = pyramid.authentication.AuthTktAuthenticationPolicy("secret", secure=True)

# ok: pyramid-authtkt-cookie-secure-unsafe-default
opts = {"secure": True}
# ok: pyramid-authtkt-cookie-secure-unsafe-default
policy_opts = pyramid.authentication.AuthTktAuthenticationPolicy("secret", **opts)
