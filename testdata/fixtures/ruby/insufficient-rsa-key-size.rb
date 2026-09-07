require 'openssl'

# ruleid: insufficient-rsa-key-size
small = OpenSSL::PKey::RSA.new(1024)

# ruleid: insufficient-rsa-key-size
small2 = OpenSSL::PKey::RSA.new(512, 'pass')

# ruleid: insufficient-rsa-key-size
small3 = OpenSSL::PKey::RSA.generate(1024)

# ok: insufficient-rsa-key-size
big = OpenSSL::PKey::RSA.new(2048)

# ok: insufficient-rsa-key-size
big2 = OpenSSL::PKey::RSA.generate(2048)

# ok: insufficient-rsa-key-size
big3 = OpenSSL::PKey::RSA.new(4096)
