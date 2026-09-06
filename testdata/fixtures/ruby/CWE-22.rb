# CWE-22 Path Traversal in Ruby
# File APIs that take a path built from user input allow directory traversal
# (../../etc/passwd) if not validated.

def show
  p = params[:file]
  name = params.get("name")
  ck = cookies[:path]
  qs = request.query_string

  # ruleid: ruby-path-traversal
  File.read(p)

  # ruleid: ruby-path-traversal
  File.open(name)

  # ruleid: ruby-path-traversal
  IO.read(ck)

  # ruleid: ruby-path-traversal
  File.read(qs)

  # ok: ruby-path-traversal
  File.read("/tmp/fixed.txt")

  # ok: ruby-path-traversal
  File.open("/var/data/file.txt", "r")

  # ok: ruby-path-traversal
  IO.read("/etc/hosts")
end
