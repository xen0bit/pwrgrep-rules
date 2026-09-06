# CWE-78 OS Command Injection in Ruby
# Ruby's shell APIs execute strings via /bin/sh when given a single argument.
# If that string is built from request parameters, an attacker can append
# arbitrary commands with ; or &&.

require 'open3'

def index
  user = params[:cmd]
  q = params["input"]
  ck = cookies[:cmd]
  body = request.body.read
  qs = request.query_string

  # ruleid: ruby-command-injection
  system(user)

  # ruleid: ruby-command-injection
  exec(q)

  # ruleid: ruby-command-injection
  Open3.popen3(ck)

  # ruleid: ruby-command-injection
  Kernel.system(body)

  # ok: ruby-command-injection
  system("ls -l /tmp")

  # ok: ruby-command-injection
  exec("echo hello")

  # ok: ruby-command-injection
  Kernel.system("fixed_command")
end

def extra
  extra_qs = request.query_string
  # ruleid: ruby-command-injection
  spawn(extra_qs)
  # ok: ruby-command-injection
  spawn("ls")
end
