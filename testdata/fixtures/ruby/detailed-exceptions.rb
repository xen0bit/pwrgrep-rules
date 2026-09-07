class AppController < ApplicationController
  # ruleid: detailed-exceptions
  def show_detailed_exceptions?(env)
    return true
  end
end

# ruleid: detailed-exceptions
config.consider_all_requests_local = true

# ruleid: detailed-exceptions
config.consider_all_requests_local = true

# ok: detailed-exceptions
config.consider_all_requests_local = false

# ok: detailed-exceptions
config.consider_all_requests_local = :conditional

def plain_helper
  # ok: detailed-exceptions
  'nothing configured here'
end
