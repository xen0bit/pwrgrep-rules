XML.class_eval do
  # ruleid: xml-external-entities-enabled
  XML.default_substitute_entities = true
end

XML.class_eval do
  # ruleid: xml-external-entities-enabled
  XML.default_substitute_entities = true
end

LibXML::XML.class_eval do
  # ruleid: xml-external-entities-enabled
  XML.default_substitute_entities = true
end

XML.class_eval do
  # ok: xml-external-entities-enabled
  XML.default_substitute_entities = false
end

# ok: xml-external-entities-enabled
XML.default_substitute_entities = true

def plain_helper
  # ok: xml-external-entities-enabled
  'no class_eval here'
end
