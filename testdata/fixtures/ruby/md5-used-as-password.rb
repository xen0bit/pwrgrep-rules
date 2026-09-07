require 'digest'

def hash_login(pw)
  h = Digest::MD5.hexdigest(pw)
  # ruleid: md5-used-as-password
  save_password(h)
end

def hash_register(pw)
  h = Digest::MD5.new
  h.update(pw)
  # ruleid: md5-used-as-password
  update_password(h.hexdigest)
end

def hash_reset(pw)
  d = Digest::MD5.digest(pw)
  # ruleid: md5-used-as-password
  store_password(d)
end

def hash_sha(pw)
  h = Digest::SHA256.hexdigest(pw)
  # ok: md5-used-as-password
  save_password(h)
end

def digest_only(data)
  # ok: md5-used-as-password
  Digest::MD5.hexdigest(data)
end

def plain(pw)
  # ok: md5-used-as-password
  save_password(pw)
end
