# ok: missing-csrf-protection
class SafeController < ActionController::Base
  protect_from_forgery :with => :exception
end

# ok: missing-csrf-protection
class PlainRuby
  def index
  end
end

def helper_method_line
  # ok: missing-csrf-protection
  'not a controller at all'
end

# ruleid: missing-csrf-protection
class VulnController < ActionController::Base
  def index
  end
end

# ruleid: missing-csrf-protection
class VulnTwoController < ActionController::Base
  def show
  end
end

# ruleid: missing-csrf-protection
class VulnThreeController < ActionController::Base
  helper_method :current_user
end
