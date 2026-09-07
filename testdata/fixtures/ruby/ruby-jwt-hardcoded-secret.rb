require 'jwt'

payload = { data: 'test' }

# ruleid: ruby-jwt-hardcoded-secret
t1 = JWT.encode(payload, 'secret', 'HS256')

# ruleid: ruby-jwt-hardcoded-secret
t2 = JWT.encode(payload, 'other-secret', 'HS256')

# ruleid: ruby-jwt-hardcoded-secret
d1 = JWT.decode(t1, 'secret', true, algorithm: 'HS256')

# ok: ruby-jwt-hardcoded-secret
s1 = JWT.encode(payload, ENV['JWT_SECRET'], 'HS256')

def issue(payload, secret)
  # ok: ruby-jwt-hardcoded-secret
  JWT.encode(payload, secret, 'HS256')
end

def read(token, secret)
  # ok: ruby-jwt-hardcoded-secret
  JWT.decode(token, secret, true, algorithm: 'HS256')
end
