require 'net/http'

def http_index
  url = params[:url]
  # ruleid: avoid-tainted-http-request
  Net::HTTP.get(url)

  other = params['other']
  # ruleid: avoid-tainted-http-request
  Net::HTTP.post(other, 'data')

  third = request.env['url']
  # ruleid: avoid-tainted-http-request
  Net::HTTP.get(third)
end

def http_safe
  # ok: avoid-tainted-http-request
  Net::HTTP.get('https://example.com/static')

  # ok: avoid-tainted-http-request
  Net::HTTP.post('https://example.com/submit', 'data')

  # ok: avoid-tainted-http-request
  'get in a string is not a call'
end
