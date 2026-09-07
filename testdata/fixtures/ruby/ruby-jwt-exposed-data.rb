require 'jwt'

def issue_public(a, payload, c)
  # ruleid: ruby-jwt-exposed-data
  JWT.encode(payload, 'secret', 'HS256')
end

def issue_user(a, payload, c)
  # ruleid: ruby-jwt-exposed-data
  JWT.encode(payload, 'secret', 'HS256')
end

def issue_order(a, payload, c)
  # ruleid: ruby-jwt-exposed-data
  JWT.encode(payload, 'secret', 'HS256')
end

def safe_const(a, b, c)
  # ok: ruby-jwt-exposed-data
  JWT.encode({ sub: 1 }, 'secret', 'HS256')
end

def safe_two(payload, opts)
  # ok: ruby-jwt-exposed-data
  JWT.encode(payload, 'secret', 'HS256')
end

def safe_plain(a, b, c)
  # ok: ruby-jwt-exposed-data
  'nothing encoded here'
end
