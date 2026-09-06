# CWE-611: XXE via REXML - external entities resolved by default

require 'rexml/document'

def parse_upload
  data = params[:xml]
  # ruleid: ruby-xxe
  REXML::Document.new(data)
end

def parse_body
  xml = request.body.read
  # ruleid: ruby-xxe
  REXML::Document.new(xml)
end

def safe_literal
  # ok: ruby-xxe
  REXML::Document.new("<root>hello</root>")
end

def safe_disabled
  fixed = "<root>safe</root>"
  # ok: ruby-xxe
  REXML::Document.new(fixed)
end
def parse_params
  xml = params[:data]
  # ruleid: ruby-xxe
  REXML::Document.new(xml)
end

def parse_req
  body = request.body.read
  # ruleid: ruby-xxe
  REXML::Document.new(body)
end

def safe3
  # ok: ruby-xxe
  REXML::Document.new("<root>fixed</root>")
end
