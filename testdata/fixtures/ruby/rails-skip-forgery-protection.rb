class VulnController < ApplicationController
  # ruleid: rails-skip-forgery-protection
  skip_forgery_protection
end

class VulnTwoController < ApplicationController
  # ruleid: rails-skip-forgery-protection
  skip_forgery_protection only: [:webhook]
end

class VulnThreeController < ApplicationController
  before_action :auth
  # ruleid: rails-skip-forgery-protection
  skip_forgery_protection
end

class SafeController < ApplicationController
  # ok: rails-skip-forgery-protection
  protect_from_forgery with: :exception
end

class PlainController < ApplicationController
  # ok: rails-skip-forgery-protection
  before_action :require_login
end

# ok: rails-skip-forgery-protection
HELPER = 'skip_forgery_protection in a string is not a call'
