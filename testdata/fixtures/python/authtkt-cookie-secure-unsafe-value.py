# Pyramid AuthTkt cookie with secure=False.
#
# An explicit False sends the auth cookie over http. True is the fix,
# and its call line is the ok.
import pyramid.authentication


# ruleid: pyramid-authtkt-cookie-secure-unsafe-value
policy_a = pyramid.authentication.AuthTktAuthenticationPolicy("secret", secure=False)

# ruleid: pyramid-authtkt-cookie-secure-unsafe-value
policy_b = pyramid.authentication.AuthTktCookieHelper("secret", secure=False)

# ruleid: pyramid-authtkt-cookie-secure-unsafe-value
policy_c = pyramid.authentication.AuthTktAuthenticationPolicy("s", secure=False, timeout=1)

# ok: pyramid-authtkt-cookie-secure-unsafe-value
policy_ok = pyramid.authentication.AuthTktAuthenticationPolicy("secret", secure=True)

# ok: pyramid-authtkt-cookie-secure-unsafe-value
policy_ok2 = pyramid.authentication.AuthTktCookieHelper("secret", secure=True)

# ok: pyramid-authtkt-cookie-secure-unsafe-value
policy_plain = pyramid.authentication.AuthTktAuthenticationPolicy("secret")
