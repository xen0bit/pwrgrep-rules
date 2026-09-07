require 'openssl'

# ruleid: hardcoded-secret-rsa-passphrase
key = OpenSSL::PKey::RSA.new(2048, 'hunter2')

# ruleid: hardcoded-secret-rsa-passphrase
key2 = OpenSSL::PKey::RSA.new(2048, 's3cret')

# ruleid: hardcoded-secret-rsa-passphrase
key3 = OpenSSL::PKey::RSA.new(4096, 'p@ss')

# ok: hardcoded-secret-rsa-passphrase
safe = OpenSSL::PKey::RSA.new(2048)

# ok: hardcoded-secret-rsa-passphrase
safe2 = OpenSSL::PKey::RSA.new(2048, pass)

# ok: hardcoded-secret-rsa-passphrase
safe3 = OpenSSL::PKey::RSA.new(2048, ENV['KEY_PASS'])
