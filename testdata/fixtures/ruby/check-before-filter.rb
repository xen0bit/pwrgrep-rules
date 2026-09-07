class VulnController < ApplicationController
  # ruleid: check-before-filter
  skip_before_action :auth, :except => [:index]
end

class VulnTwoController < ApplicationController
  # ruleid: check-before-filter
  skip_before_filter :auth, :except => [:show]
end

class VulnThreeController < ApplicationController
  # ruleid: check-before-filter
  skip_filter :auth, :except => [:edit]
end

class SafeController < ApplicationController
  # ok: check-before-filter
  before_action :auth
end

class SafeTwoController < ApplicationController
  # ok: check-before-filter
  skip_before_action :auth, :only => [:webhook]
end

class PlainController < ApplicationController
  # ok: check-before-filter
  helper_method :current_user
end
