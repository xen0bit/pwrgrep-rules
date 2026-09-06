# CWE-306: Missing Authentication — skipping authenticate_user! allows unauthenticated access.
# Devise's authenticate_user! ensures the user is logged in; skipping it with
# skip_before_action leaves the action open to anonymous callers.
# Vulnerable actions skip authentication; safe actions keep it.

class AdminController < ApplicationController
  # ruleid: ruby-missing-auth
  skip_before_action :authenticate_user!

  def dashboard
    @users = User.all
  end
end

class TransfersController < ApplicationController
  # ruleid: ruby-missing-auth
  skip_before_action :authenticate_user!, only: [:create]

  def create
    Transfer.create(amount: params[:amount])
  end
end

class SensitiveController < ApplicationController
  # ruleid: ruby-missing-auth
  skip_before_action :require_login

  def show
    render json: User.find(params[:id])
  end
end

# ok: ruby-missing-auth
class SafeController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @users = User.all
  end
end

# ok: ruby-missing-auth
class AnotherSafeController < ApplicationController
  before_action :require_login

  def show
    render json: User.find(params[:id])
  end
end
