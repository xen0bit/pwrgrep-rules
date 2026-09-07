require 'jwt'

# ruleid: ruby-jwt-exposed-credentials
payload = { name: 'ann', password: 'hunter2', sub: 1 }
token = JWT.encode(payload, 'secret', 'HS256')

# ruleid: ruby-jwt-exposed-credentials
creds = { name: 'bob', password: 's3cret', sub: 2 }
token2 = JWT.encode(creds, 'secret', 'HS256')

# ruleid: ruby-jwt-exposed-credentials
login = { name: 'cid', password: 'p@ss', sub: 3 }
token3 = JWT.encode(login, 'secret', 'HS256')

other = { name: 'dee', sub: 4 }
# ok: ruby-jwt-exposed-credentials
token4 = JWT.encode(other, 'secret', 'HS256')

# ok: ruby-jwt-exposed-credentials
token5 = 'no encoding here'

# ok: ruby-jwt-exposed-credentials
note = 'password: nothing encoded'
