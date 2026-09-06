# CWE-918 Server-Side Request Forgery (SSRF) in Ruby
# Fetching a URL built from user input lets an attacker reach internal hosts
# and cloud metadata endpoints.

require 'net/http'
require 'open-uri'

def fetch
  url = params[:url]
  u2 = params.get("dest")
  ck = cookies[:url]
  qs = request.query_string

  # ruleid: ruby-ssrf
  Net::HTTP.get(url)

  # ruleid: ruby-ssrf
  Net::HTTP.post(u2)

  # ruleid: ruby-ssrf
  open(ck)

  # ruleid: ruby-ssrf
  RestClient.get(qs)

  # ok: ruby-ssrf
  Net::HTTP.get(URI("http://example.com"))

  # ok: ruby-ssrf
  open("http://example.com/static")

  # ok: ruby-ssrf
  HTTParty.get("https://api.example.com/data")
end
