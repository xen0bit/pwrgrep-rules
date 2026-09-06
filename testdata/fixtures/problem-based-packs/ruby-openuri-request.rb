# CWE-319: OpenURI cleartext
require 'open-uri'
# ruleid: openuri-request
URI.open('http://example.com')
# ruleid: openuri-request
URI.open('http://example.com', 'r')
# ok: openuri-request
URI.open('https://example.com')
# ok: openuri-request
puts "safe"
