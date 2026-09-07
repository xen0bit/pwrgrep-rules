# CWE-319: cleartext HTTP via httparty/restclient. Literal http:// URLs flag,
# as do variable URLs (audited); https literals stay quiet.
require 'httparty'
require 'rest-client'

# ruleid: http-client-requests
HTTParty.get("http://example.com")
# ruleid: http-client-requests
RestClient.get "http://example.com/api"
# ruleid: http-client-requests
HTTParty.post(path)
# ruleid: http-client-requests
RestClient::Request.execute(:method => :get, url: "http://example.com/x")

# ok: http-client-requests
HTTParty.get("https://example.com")
# ok: http-client-requests
RestClient.get "https://example.com/api"
# ok: http-client-requests
RestClient::Request.execute(:method => :get, url: "https://example.com/x")
