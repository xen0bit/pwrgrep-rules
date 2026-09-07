Rails.application.configure do
  # ruleid: file-disclosure
  config.serve_static_assets = true
end

Rails.application.configure do
  # ruleid: file-disclosure
  config.serve_static_assets = true
end

Rails.application.configure do
  # ruleid: file-disclosure
  config.serve_static_assets = true
end

Rails.application.configure do
  # ok: file-disclosure
  config.serve_static_assets = false
end

Rails.application.configure do
  # ok: file-disclosure
  config.serve_static_files = true
end

Rails.application.configure do
  # ok: file-disclosure
  config.serve_static_assets = :conditional
end
