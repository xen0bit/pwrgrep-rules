# CWE-295: Improper Certificate Validation - VERIFY_NONE

require 'net/http'
require 'openssl'

def fetch(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  # ruleid: ruby-tls-insecure
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http
end

def insecure2(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  # ruleid: ruby-tls-insecure
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http.get(uri.path)
end

def strict(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  # ok: ruby-tls-insecure
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http
end

def no_ssl(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  # ok: ruby-tls-insecure
  http.get(uri.path)
end
def insecure3(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  # ruleid: ruby-tls-insecure
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http
end

def insecure4(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  # ruleid: ruby-tls-insecure
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http.request_get(uri.path)
end

def strict2(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  # ok: ruby-tls-insecure
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http
end
