Rails.application.configure do
  # ruleid: force-ssl-false
  config.force_ssl = false
end

Rails.application.configure do
  # ruleid: force-ssl-false
  config.force_ssl = false
end

Rails.application.configure do
  # ruleid: force-ssl-false
  config.force_ssl = false
end

Rails.application.configure do
  # ok: force-ssl-false
  config.force_ssl = true
end

Rails.application.configure do
  # ok: force-ssl-false
  config.force_ssl = :conditional
end

Rails.application.configure do
  # ok: force-ssl-false
  config.ssl_options = {}
end
