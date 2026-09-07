require 'jwt'

payload = { data: 'test' }

# ruleid: ruby-jwt-none-alg
t1 = JWT.encode(payload, 'secret', 'none')

# ruleid: ruby-jwt-none-alg
t2 = JWT.encode(payload, 'secret', 'none')

# ruleid: ruby-jwt-none-alg
t3 = JWT.encode(payload, nil, 'none')

# ok: ruby-jwt-none-alg
s1 = JWT.encode(payload, 'secret', 'HS256')

# ok: ruby-jwt-none-alg
s2 = JWT.encode(payload, 'secret', 'RS256')

# ok: ruby-jwt-none-alg
s3 = 'none'
