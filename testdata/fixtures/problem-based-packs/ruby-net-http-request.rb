# CWE-319: Net::HTTP cleartext
require 'net/http'
# ruleid: net-http-request
uri = URI('http://example.com')
Net::HTTP.get(uri)
# ruleid: net-http-request
uri2 = URI('http://example.com')
Net::HTTP.post_form(uri2, {})
# ok: net-http-request
uri3 = URI('https://example.com')
Net::HTTP.get(uri3)
# ok: net-http-request
uri4 = URI('http://localhost')
Net::HTTP.get(uri4)
