require 'digest'
require 'openssl'

def fingerprint(data)
  # ruleid: ruby-weak-hash
  Digest::SHA1.hexdigest(data)
end

def tag(data)
  # ruleid: ruby-weak-hash
  OpenSSL::Digest::SHA1.digest(data)
end

def digest(data)
  # ok: ruby-weak-hash
  Digest::SHA256.hexdigest(data)
end

def signature(key, data)
  # ok: ruby-weak-hash
  OpenSSL::HMAC.hexdigest('sha256', key, data)
end
def extra1(data)
  # ruleid: ruby-weak-hash
  Digest::SHA1.digest(data)
end

def extra2(data)
  # ruleid: ruby-weak-hash
  OpenSSL::Digest::SHA1.hexdigest(data)
end

def safe3(data)
  # ok: ruby-weak-hash
  Digest::SHA256.hexdigest(data)
end
