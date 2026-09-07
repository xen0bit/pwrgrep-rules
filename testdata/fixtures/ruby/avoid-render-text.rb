def render_index(name)
  # ruleid: avoid-render-text
  render text: name
end

def render_other(other)
  # ruleid: avoid-render-text
  render text: other
end

def render_third(third)
  # ruleid: avoid-render-text
  render text: third
end

def render_static
  # ok: avoid-render-text
  render :show
end

def render_action
  # ok: avoid-render-text
  render :show
end

def render_plain(name)
  # ok: avoid-render-text
  render plain: name
end
