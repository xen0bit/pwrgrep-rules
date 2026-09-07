require 'jwt'

token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIn0.sig'

# ruleid: ruby-jwt-decode-without-verify
d1 = JWT.decode(token, 'secret', false)

# ruleid: ruby-jwt-decode-without-verify
d2 = JWT.decode(token, 'secret', false)

# ruleid: ruby-jwt-decode-without-verify
d3 = JWT.decode(token, nil, false)

# ok: ruby-jwt-decode-without-verify
v1 = JWT.decode(token, 'secret', true, algorithm: 'HS256')

# ok: ruby-jwt-decode-without-verify
v2 = JWT.decode(token, nil, true, algorithm: 'HS256')

# ok: ruby-jwt-decode-without-verify
v3 = 'false'
