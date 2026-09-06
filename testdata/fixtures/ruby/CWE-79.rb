# CWE-79 Cross-Site Scripting (XSS) in Ruby / Rails
# Rendering user input without escaping via raw, html_safe or render injects
# arbitrary HTML/JS into the response.

def show
  name = params[:name]
  q = params.get("q")
  ck = cookies[:x]
  body = request.body.read

  # ruleid: ruby-xss
  name.html_safe

  # ruleid: ruby-xss
  raw(q)

  # ruleid: ruby-xss
  render ck

  # ruleid: ruby-xss
  raw(body)

  # ok: ruby-xss
  render html: ERB::Util.html_escape("fixed")

  # ok: ruby-xss
  raw("fixed string")

  # ok: ruby-xss
  render html: "hello world".html_safe
end
