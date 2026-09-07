# Pyramid AuthTkt cookie with httponly=False.
#
# An explicit False leaves the auth cookie readable to scripts. True is
# the fix, and its call line is the ok.
import pyramid.authentication


# ruleid: pyramid-authtkt-cookie-httponly-unsafe-value
policy_a = pyramid.authentication.AuthTktAuthenticationPolicy("secret", httponly=False)

# ruleid: pyramid-authtkt-cookie-httponly-unsafe-value
policy_b = pyramid.authentication.AuthTktCookieHelper("secret", httponly=False)

# ruleid: pyramid-authtkt-cookie-httponly-unsafe-value
policy_c = pyramid.authentication.AuthTktAuthenticationPolicy("s", httponly=False, timeout=1)

# ok: pyramid-authtkt-cookie-httponly-unsafe-value
policy_ok = pyramid.authentication.AuthTktAuthenticationPolicy("secret", httponly=True)

# ok: pyramid-authtkt-cookie-httponly-unsafe-value
policy_ok2 = pyramid.authentication.AuthTktCookieHelper("secret", httponly=True)

# ok: pyramid-authtkt-cookie-httponly-unsafe-value
policy_plain = pyramid.authentication.AuthTktAuthenticationPolicy("secret")
