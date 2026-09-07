require 'digest'

def digest_one(data)
  # ruleid: weak-hashes-md5
  Digest::MD5.hexdigest(data)
end

def digest_two(data)
  # ruleid: weak-hashes-md5
  Digest::MD5.digest(data)
end

def digest_three
  # ruleid: weak-hashes-md5
  Digest::MD5.new
end

def digest_sha(data)
  # ok: weak-hashes-md5
  Digest::SHA256.hexdigest(data)
end

def digest_sha_new
  # ok: weak-hashes-md5
  Digest::SHA256.new
end

def digest_mention
  # ok: weak-hashes-md5
  'MD5 in a string is not use'
end
