# CWE-601 Open Redirect in Ruby / Rails
# Redirecting to a URL built from user input without validation lets an
# attacker send victims to a malicious site.

def redirect
  url = params[:url]
  dest = params.get("next")
  ck = cookies[:redirect]
  qs = request.query_string

  # ruleid: ruby-open-redirect
  redirect_to(url)

  # ruleid: ruby-open-redirect
  redirect_to(dest)

  # ruleid: ruby-open-redirect
  redirect_to(ck)

  # ruleid: ruby-open-redirect
  redirect_to(qs)

  # ok: ruby-open-redirect
  redirect_to("/home")

  # ok: ruby-open-redirect
  redirect_to(root_path)

  # ok: ruby-open-redirect
  redirect_to("https://example.com/fixed")
end
