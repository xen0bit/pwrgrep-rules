# CWE-327 Use of Broken or Risky Cryptographic Algorithm in Ruby
# MD5 and SHA1 are broken for collision resistance; SHA-256/SHA-512 should be used.

require 'digest'
require 'openssl'

def hash_data(data)
  # ruleid: ruby-insecure-hash
  Digest::MD5.hexdigest(data)

  # ruleid: ruby-insecure-hash
  Digest::SHA1.hexdigest(data)

  # ruleid: ruby-insecure-hash
  Digest::MD5.new

  # ruleid: ruby-insecure-hash
  OpenSSL::Digest::MD5.hexdigest(data)
end

def safe(data)
  # ok: ruby-insecure-hash
  Digest::SHA256.hexdigest(data)

  # ok: ruby-insecure-hash
  Digest::SHA512.hexdigest(data)

  # ok: ruby-insecure-hash
  OpenSSL::Digest::SHA256.hexdigest(data)
end
