# CWE-352: CSRF — skipping verify_authenticity_token leaves POST vulnerable.
# Rails' protect_from_forgery verifies the CSRF token; skipping it with
# skip_before_action :verify_authenticity_token allows forged requests.
# Vulnerable actions skip the verification; safe actions keep it.

class TransfersController < ApplicationController
  # ruleid: ruby-csrf
  skip_before_action :verify_authenticity_token

  def create
    Transfer.create(amount: params[:amount])
  end
end

class UpdatesController < ApplicationController
  # ruleid: ruby-csrf
  skip_before_action :verify_authenticity_token, only: [:update]

  def update
    User.update(params[:id], email: params[:email])
  end
end

class DeletesController < ApplicationController
  # ruleid: ruby-csrf
  skip_before_filter :verify_authenticity_token

  def destroy
    User.destroy(params[:id])
  end
end

# ok: ruby-csrf
class SafeController < ApplicationController
  protect_from_forgery with: :exception

  def create
    Transfer.create(amount: params[:amount])
  end
end

# ok: ruby-csrf
class AnotherSafeController < ApplicationController
  before_action :verify_authenticity_token

  def update
    User.update(params[:id], email: params[:email])
  end
end
