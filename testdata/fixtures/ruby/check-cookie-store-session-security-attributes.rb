# ruleid: check-cookie-store-session-security-attributes
MyApp::Application.config.session_store :cookie_store, :key => '_s', :httponly => false, :secure => true

# ruleid: check-cookie-store-session-security-attributes
OtherApp::Application.config.session_store :cookie_store, :key => '_s', :secure => false, :httponly => true

# ruleid: check-cookie-store-session-security-attributes
ThirdApp::Application.config.session_store :cookie_store, :key => '_s', :httponly => false, :secure => false

# ok: check-cookie-store-session-security-attributes
SafeApp::Application.config.session_store :cookie_store, :key => '_s', :httponly => true, :secure => true

# ok: check-cookie-store-session-security-attributes
OtherSafe::Application.config.session_store :cookie_store, :key => '_s', :secure => true, :httponly => true

# ok: check-cookie-store-session-security-attributes
PLAIN = 'no session store here'
