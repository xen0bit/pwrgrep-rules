def link_index
  name = params[:name]
  # ruleid: avoid-link-to
  link_to(name, '/home')
end

def link_other
  other = params['other']
  # ruleid: avoid-link-to
  link_to(other, root_path)
end

def link_third
  third = cookies[:dest]
  # ruleid: avoid-link-to
  link_to(third, '/go')
end

def link_safe
  # ok: avoid-link-to
  link_to('Home', '/home')
end

def link_static
  # ok: avoid-link-to
  link_to('About', about_path)
end

def link_plain
  # ok: avoid-link-to
  '<a href="/home">Home</a>'
end
