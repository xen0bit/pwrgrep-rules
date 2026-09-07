def redirect_index
  dest = params[:dest]
  # ruleid: avoid-redirect
  redirect_to(dest)
end

def redirect_other
  other = params['other']
  # ruleid: avoid-redirect
  redirect_to(other)
end

def redirect_third
  third = cookies[:dest]
  # ruleid: avoid-redirect
  redirect_to(third)
end

def redirect_safe
  # ok: avoid-redirect
  redirect_to('/home')
end

def redirect_path
  # ok: avoid-redirect
  redirect_to(root_path)
end

def redirect_plain
  # ok: avoid-redirect
  'no redirect here'
end
