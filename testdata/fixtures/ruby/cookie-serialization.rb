Rails.application.configure do
  # ruleid: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :marshal
end

Rails.application.configure do
  # ruleid: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :hybrid
end

Rails.application.configure do
  # ruleid: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :marshal
end

Rails.application.configure do
  # ok: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :json
end

Rails.application.configure do
  # ok: cookie-serialization
  Rails.application.config.action_dispatch.cookies_serializer = :message_pack
end

Rails.application.configure do
  # ok: cookie-serialization
  config.action_dispatch.cookies_serializer = :json
end
