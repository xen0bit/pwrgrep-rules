# ruleid: check-rails-session-secret-handling
MyApp::Application.config.secret_token = "abc123"

# ruleid: check-rails-session-secret-handling
OtherApp::Application.config.secret_key_base = "def456"

# ruleid: check-rails-session-secret-handling
Rails.application.config.secret = "ghi789"

# ok: check-rails-session-secret-handling
SafeApp::Application.config.other_setting = "xyz"

# ok: check-rails-session-secret-handling
SafeApp::Application.config.secret_token = ENV["SECRET"]

# ok: check-rails-session-secret-handling
plain = "no secret assignment here"
