# CWE-502 Deserialization of Untrusted Data in Ruby
# Loading YAML/Marshal/Oj from user input can instantiate arbitrary objects
# and execute code.

require 'yaml'
require 'oj'

def load_data
  data = params[:data]
  raw = cookies[:payload]
  body = request.body.read
  qs = request.query_string

  # ruleid: ruby-deserialization
  YAML.load(data)

  # ruleid: ruby-deserialization
  Marshal.load(raw)

  # ruleid: ruby-deserialization
  Oj.load(body)

  # ruleid: ruby-deserialization
  YAML.load(qs)

  # ok: ruby-deserialization
  YAML.safe_load("a: 1")

  # ok: ruby-deserialization
  JSON.parse("{\"a\": 1}")

  # ok: ruby-deserialization
  YAML.load("--- fixed: true", permitted_classes: [Symbol])
end
