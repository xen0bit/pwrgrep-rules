Rails.application.configure do
  # ruleid: json-entity-escape
  ActiveSupport.escape_html_entities_in_json = false
end

Rails.application.configure do
  # ruleid: json-entity-escape
  config.active_support.escape_html_entities_in_json = false
end

Rails.application.configure do
  # ruleid: json-entity-escape
  ActiveSupport.escape_html_entities_in_json = false
end

Rails.application.configure do
  # ok: json-entity-escape
  ActiveSupport.escape_html_entities_in_json = true
end

Rails.application.configure do
  # ok: json-entity-escape
  config.active_support.escape_html_entities_in_json = true
end

Rails.application.configure do
  # ok: json-entity-escape
  config.other_setting = false
end
