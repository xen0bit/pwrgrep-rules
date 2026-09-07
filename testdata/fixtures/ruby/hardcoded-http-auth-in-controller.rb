class SecretsController < ApplicationController
  # ruleid: hardcoded-http-auth-in-controller
  http_basic_authenticate_with :name => "admin", :password => "hunter2"
end

class OtherController < ApplicationController
  # ruleid: hardcoded-http-auth-in-controller
  http_basic_authenticate_with :name => "root", :password => "s3cret"
end

class ThirdController < ApplicationController
  # ruleid: hardcoded-http-auth-in-controller
  http_basic_authenticate_with :password => "p@ss", :name => "n"
end

class EnvController < ApplicationController
  # ok: hardcoded-http-auth-in-controller
  http_basic_authenticate_with :name => "admin", :password => ENV["PW"]
end

class TokenController < ApplicationController
  # ok: hardcoded-http-auth-in-controller
  http_token_authenticate_with :password => "hunter2"
end

class PlainController < ApplicationController
  # ok: hardcoded-http-auth-in-controller
  before_action :require_login
end
