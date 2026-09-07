def render_index(name)
  # ruleid: avoid-render-inline
  render inline: name
end

def render_other(other)
  # ruleid: avoid-render-inline
  render inline: other
end

def render_third(third)
  # ruleid: avoid-render-inline
  render inline: third
end

def render_static
  # ok: avoid-render-inline
  render :show
end

def render_action
  # ok: avoid-render-inline
  render :show
end

def render_plain(name)
  # ok: avoid-render-inline
  render plain: name
end
